//
//  FSDocumentInspectorPane.h
//  FlexiSheet
//
//  Created by Stefan Leuker on 15-DEC-2001.
//  Copyright (c) 2001-2003 Stefan Leuker. All rights reserved.
//
//  $Id$

#import <FSInspectorPane.h>

@class FSDocument;

@interface FSDocumentInspectorPane : FSInspectorPane
{
    IBOutlet NSTextField       *header;
    IBOutlet NSTableView       *tables;
    IBOutlet NSTableView       *views;
    IBOutlet NSTableColumn     *tableColumn;
    IBOutlet NSTableColumn     *viewColumn;

    FSDocument                 *document;
    NSArray                    *worksheets;
}

- (IBAction)selectTable:(id)notUsed;

@end
