//
//  FSItemInspectorPane.h
//  FlexiSheet
//
//  Created by Stefan Leuker on 15-DEC-2001.
//  Copyright (c) 2001-2003 Stefan Leuker. All rights reserved.
//
//  $Id$

#import <FSInspectorPane.h>

@protocol FSItem;

@interface FSItemInspectorPane : FSInspectorPane
{
    IBOutlet NSTextField        *labelField;
    IBOutlet NSTextField        *groupText;
    IBOutlet NSButton           *groupButton;
    IBOutlet NSTextField        *tableText;
    IBOutlet NSButton           *tableButton;

    id <FSItem>                    item;
}

- (void)setItemLabel:sender;

- (IBAction)inspectGroup:sender;
- (IBAction)inspectTable:sender;

@end
