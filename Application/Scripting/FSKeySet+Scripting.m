//
//  FSKeySet+Scripting.m
//  FlexiSheet
//
//  Created by Stefan Leuker on 21-MAY-2002.
//  Copyright (c) 2002-2003 Stefan Leuker. All rights reserved.
//
//  $Id$

#import "FlexiSheet.h"

@implementation FSKeySet (Scripting)

- (NSScriptObjectSpecifier*)objectSpecifier;
    // Returns the key set with it's reference to a table.
{
    NSArray      *keysets = [[self table] scriptingKeysets];
    unsigned int  index = [keysets indexOfObjectIdenticalTo:self];

    if (index != NSNotFound) {
        NSScriptObjectSpecifier *containerRef = [[self table] objectSpecifier];
        return [[[NSIndexSpecifier allocWithZone:[self zone]] initWithContainerClassDescription:[containerRef keyClassDescription]
                                                                             containerSpecifier:containerRef
                                                                                            key:@"scriptingKeysets"
                                                                                          index:index] autorelease];
    } else {
        return nil;
    }
}

@end
