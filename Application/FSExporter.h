//
//  FSExporter.h
//  FlexiSheet
//
//  Created by Stefan Leuker on 18-APR-2002.
//  Copyright (c) 2001-2003 Stefan Leuker. All rights reserved.
//
//  $Id$

#import <AppKit/AppKit.h>

@class FSTable, FSWindowController;

@interface FSExporter : NSObject
{
    IBOutlet NSBox          *accessory;

    // The export sheet connections
    IBOutlet NSButton       *exportRowHeaders;
    IBOutlet NSButton       *exportColumnItems;
    IBOutlet NSPopUpButton  *valueSeparator;
    IBOutlet NSPopUpButton  *lineSeparator;
    IBOutlet NSPopUpButton  *encoding;
    IBOutlet NSPopUpButton  *encoder;
    IBOutlet NSWindow       *sheet;
}

+ (FSExporter*)sharedExporter;

- (NSView*)accessoryView;

- (IBAction)changeEncoder:(id)sender;

- (void)runExportSheetForWindowController:(FSWindowController*)wc;

@end
