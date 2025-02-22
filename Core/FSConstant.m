//  $Id$
//
//  FSConstant.m
//  FlexiSheet
//
//  Created by Stefan Leuker on 30-SEP-2001.
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

#import "FSConstant.h"
#import "FSSelection.h"
#import "FSLog.h"
#import "FoundationExtentions.h"


@implementation FSConstant
/*" FSConstant is a constant value defined in the formula space. "*/

- (id)initWithValue:(id)value isString:(BOOL)isString number:(NSNumber*)number
{
    self = [super init];
    _constant = [value copy];
    _isString = isString;
    _number = [number retain];
    if (_number) {
        //[FSLog logDebug:@"Creating constant with number %@", [_number description]];
    }
    return self;
}

- (void)dealloc
{
    [_constant release];
    [_number release];
    [super dealloc];
}

+ (FSConstant*)constantWithValue:(NSString*)value
/*" FSConstant objects are initialized with NSString values.
    They keep their formating, so this is better than NSNumber.
    Quoted strings are stored as string constants. "*/
{
    BOOL      isString = NO;
    NSNumber *number = nil;
    
    if ([value isDoubleQuotedString]) {
        isString = YES;
        value = [value stringByTrimmingQuotes];
    } else {
        NSScanner *scanner = [NSScanner scannerWithString:value];
        double     dValue;
        
        if ([scanner scanDouble:&dValue]) {
            if ([scanner isAtEnd]) {
                number = [NSNumber numberWithDouble:dValue];
            } else if ([scanner scanString:@"%" intoString:NULL] && [scanner isAtEnd]) {
                number = [NSNumber numberWithDouble:dValue/100.0];
            } else {
                [FSLog logError:@"Could not create number constant from string %@", value];
                return nil;
            }
        }
    }

    return [[[self alloc] initWithValue:value isString:isString number:number] autorelease];
}

- (id)formulaValueForKeySet:(FSKeySet*)ks
    /*" Returns the constant value. "*/
{
    if (_isString) {
        return _constant;
    } else {
        return _number;
    }
}


- (FSSelection*)referencedSelectionInFormulaSpace:(FSFormulaSpace*)fs
{
    return [FSSelection selection];
}


- (NSString*)creatorString
{
    if (_isString)
        return [NSString stringWithFormat:@"\"%@\"", _constant];
    return _constant;
}


- (NSString*)description
{
    return _constant;
}

@end
