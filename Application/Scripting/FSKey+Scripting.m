//
//  FSKey+Scripting.m
//  FlexiSheet
//
//  Created by Stefan Leuker on 20-MAY-2002.
//  Copyright (c) 2002-2003 Stefan Leuker. All rights reserved.
//
//  $Id$

#import "FlexiSheet.h"

@implementation FSKey (Scripting)

- (NSScriptObjectSpecifier*)objectSpecifier;
// Returns itself always as the key of the group it's in.
{
    NSArray      *items = [[self group] items];
    unsigned int  index = [items indexOfObjectIdenticalTo:self];

    if (index != NSNotFound) {
        NSScriptObjectSpecifier *containerRef = [[self group] objectSpecifier];
        return [[[NSIndexSpecifier allocWithZone:[self zone]] initWithContainerClassDescription:[containerRef keyClassDescription]
                                                                             containerSpecifier:containerRef
                                                                                            key:@"items"
                                                                                          index:index] autorelease];
    } else {
        return nil;
    }
}

@end
