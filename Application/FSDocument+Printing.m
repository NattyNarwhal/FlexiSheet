//
//  FSDocument+Printing.m
//  FlexiSheet
//
//  Created by Stefan Leuker on 06-OCT-2002.
//  Copyright (c) 2002-2003 Stefan Leuker. All rights reserved.
//
//  $Id$

#import "FlexiSheet.h"
#import "FSDocument.h"

@implementation FSDocument (Printing)

- (void)printShowingPrintPanel:(BOOL)flag
{
    NSPrintInfo        *printInfo = [self printInfo];
    NSPrintOperation   *printOp;
    NSWindow           *docWindow = [NSApp mainWindow];
    FSWindowController *controller = [docWindow windowController];

    printOp = [NSPrintOperation printOperationWithView:[controller tableView]
                                             printInfo:printInfo];
    [printOp setShowPanels:flag];
    [printOp setCanSpawnSeparateThread:YES];

    if (docWindow) {
        [printOp runOperationModalForWindow:docWindow delegate:nil
                             didRunSelector:NULL contextInfo:NULL];
    } else {
        [printOp runOperation];
    }
}

@end
