//  $Id$
//
//  FlexiSheet.h
//  FlexiSheet
//
//  Created by Stefan Leuker on 09-MAY-2002.
//

// Based on Apple's cool Cocoa frameworks
#import <Cocoa/Cocoa.h>

#define FS_LOCALIZE(__STRG__) [[NSBundle mainBundle] localizedStringForKey:(__STRG__) value:@"" table:nil]

// FlexiSheet core
#import <FSCore/FSCore.h>
#import <FSCore/FoundationExtentions.h>
#import <FSCore/FSParserFunctions.h>

// Application structure (Scriptable)
#import "FSController.h"
#import "FSDocument.h"
#import "FSWorksheet.h"
#import "FSTableController.h"
#import "FSChartController.h"

// Protocols
#import "FSPasteboardHandling.h"
#import "FSInspection.h"
#import "FSMatrixDataSource.h"

// GUI
#import "FSFormulaTable.h"
#import "FSHeaderDock.h"
#import "FSTableTabs.h"
#import "FSTableView.h"
#import "FSMatrix.h"
#import "FSVarioMatrix.h"
#import "FSCellStyle.h"

// GUI helpers
#import "SLFloatingMark.h"
#import "ImageAndTextCell.h"
#import "FSHeaderLayout.h"

// AppleScript support
// No header files yet

//#define FSActiveDocumentChangedNotification @"FSActiveDocumentChangedNotification"
