//  $Id$
//
//  FSObject.m
//  FlexiSheet
//
//  Created by Stefan Leuker on 13-MAR-2002.
//
//  Copyright (c) 2001-2004, Stefan Leuker.        All rights reserved.
//  
//  Redistribution and use in source and binary forms,  with or without
//  modification,  are permitted provided that the following conditions
//  are met:
//  
//  *  Redistributions of source code must retain the above copyright
//     notice,  this list of conditions and the following disclaimer.
//  
//  *  Redistributions  in  binary  form  must  reproduce  the  above
//     copyright notice,  this  list of conditions  and the following
//     disclaimer  in  the  documentation  and / or  other  materials
//     provided with the distribution.
//  
//  *  Neither the name  "FlexiSheet"  nor the names of its copyright
//     holders  or  contributors  may  be used  to endorse or promote
//     products  derived  from  this software  without specific prior
//     written permission.
//  
//  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
//  "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES,  INCLUDING,  BUT NOT
//  LIMITED TO,  THE IMPLIED WARRANTIES OF MERCHANTABILITY AND  FITNESS
//  FOR  A PARTICULAR PURPOSE  ARE  DISCLAIMED.  IN NO EVENT  SHALL THE
//  COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
//  INCIDENTAL, SPECIAL, EXEMPLARY OR CONSEQUENTIAL DAMAGES (INCLUDING,
//  BUT NOT LIMITED TO,  PROCUREMENT  OF  SUBSTITUTE GOODS OR SERVICES;
//  LOSS OF USE,  DATA,  OR PROFITS;  OR BUSINESS INTERRUPTION) HOWEVER
//  CAUSED AND ON ANY THEORY OF LIABILITY,  WHETHER IN CONTRACT, STRICT
//  LIABILITY, OR TORT  (INCLUDING NEGLIGENCE OR OTHERWISE)  ARISING IN
//  ANY WAY  OUT  OF  THE USE OF THIS SOFTWARE,  EVEN IF ADVISED OF THE
//  POSSIBILITY OF SUCH DAMAGE.
//  

#import "FSObject.h"
#import <objc/objc.h>
#import <objc/objc-class.h>

static NSString  *COMPLAIN_MISSING_IMP = @"Class %@ needs this code:\n\
+ (Pool *) instancePool\n\
{\n\
    static Pool  myPool;\n\
        \n\
        return( &myPool);\n\
}";


@implementation FSObject

+ (id)allocWithZone:(NSZone*)zone
{
    Pool  *pool;
    id    obj;

    pool = [self instancePool];    // get this class' pool
    if(!pool->poolClass) {         // if first time alloc
        pool->poolClass = self;    // init pool structure
        pool->poolSize = [self poolSize];
        pool->pool = malloc(sizeof(id) * pool->poolSize);
        //NSLog(@"Starting object pool for %@.", self);
    } else {
        if (pool->poolClass != self)  // sanity check
            [NSException raise:NSGenericException
                        format:COMPLAIN_MISSING_IMP, self];
    }

    if(pool->low == pool->high) {   // if pool empty, allocate
        obj = NSAllocateObject(self, 0, NULL);
        //NSLog(@"Creating instance of %@", self);
        return obj;
    }

    //
    // reuse and clear
    //
    //NSLog(@"Reusing instance of %@", self);
    obj = pool->pool[pool->low];
    pool->low = (pool->low + 1) % pool->poolSize;
    memset(obj+1, 0, ((struct objc_class *) self)->instance_size - 4);
    return obj;
}


- (void)dealloc
{
    Pool          *pool;
    unsigned int   next;

    pool = [isa instancePool];
    next = (pool->high + 1) % pool->poolSize;

    if( next == pool->low) { // pool full ?
        //NSLog(@"Pool is full.  Dealloc instance of %@", pool->poolClass);
        NSDeallocateObject(self);
        return;
    }

    //
    // add object to pool
    //
    //NSLog(@"Adding instance of %@ to pool.", pool->poolClass);
    pool->pool[pool->high] = self;
    pool->high = next;
}


+ (Pool*)instancePool
// FSObject is never instanciated.  It is a abstract super class.
{
    [NSException raise:NSGenericException
                format:COMPLAIN_MISSING_IMP, self];
    return 0;
}


+ (unsigned int)poolSize
{
    return 1000;
}

@end
