//
//  FSMultipleSelectionInspectorPane.m
//  FlexiSheet
//
//  Created by Stefan Leuker on 15-DEC-2001.
//  Copyright (c) 2001-2003 Stefan Leuker. All rights reserved.
//
//  $Id$

#import "FSMultipleSelectionInspectorPane.h"


@implementation FSMultipleSelectionInspectorPane

+ (void)initialize
{
    [FSInspectorPane registerInspectorPane:self];
}


- (NSString*)paneNibName
{
    return @"MultipleSelectionInspector";
}


- (NSString*)inspectorName
{
    return @"Multiple Selection";
}


- (NSString*)paneIdentifier
{
    return @"MultipleSelection";
}

@end
