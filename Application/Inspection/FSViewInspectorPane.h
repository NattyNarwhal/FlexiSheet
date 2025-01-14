//
//  FSViewInspectorPane.h
//  FlexiSheet
//
//  Created by Stefan Leuker on 16-DEC-2001.
//  Copyright (c) 2001-2003 Stefan Leuker. All rights reserved.
//
//  $Id$

#import <FSInspectorPane.h>

@class FSWindowController;

@interface FSViewInspectorPane : FSInspectorPane
{
    IBOutlet NSTextView        *comments;
    IBOutlet NSTextField       *nameField;
    IBOutlet NSTextField       *documentField;
    IBOutlet NSTextField       *tableField;
}

- (IBAction)setViewName:sender;
- (IBAction)inspectDocument:sender;
- (IBAction)inspectTable:sender;

@end
