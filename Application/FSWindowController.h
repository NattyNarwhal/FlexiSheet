//
//  FSWindowController.h
//  FlexiSheet
//
//  Created by Stefan Leuker on 31-JAN-2001.
//  Copyright (c) 2001-2003 Stefan Leuker. All rights reserved.
//
//  $Id$

#import <AppKit/AppKit.h>

@class FSTable, FSKeySet, FSTableView, FSHeaderDock, FSCellStyle;
@class FSSortPanelController;

@interface FSWindowController : NSWindowController {
    IBOutlet FSHeaderDock *pageDock;  // The bottom tabs
    IBOutlet FSHeaderDock *rightDock; // The right tabs
    IBOutlet FSHeaderDock *headDock;  // The columns
    IBOutlet FSHeaderDock *leftDock;  // The rows
    IBOutlet FSTableView  *tableView; // The cell container

    // Private
    FSWorksheet           *_worksheet; // not retained.
    FSTable               *_table; /*" The table this view displays. "*/
    NSMutableArray        *_pageHeaders;
    NSArray               *_pageKeySets;

    NSMutableArray        *_rightHeaders;
    NSArray               *_rightKeySets;

    NSMutableArray        *_topHeaders;
    NSArray               *_topKeySets;

    NSMutableArray        *_sideHeaders;
    NSArray               *_sideKeySets;

    NSString              *_name;
    
    NSMutableDictionary   *_headerColors;
    FSSortPanelController *_sortController;
}

- (FSWorksheet*)worksheet;
- (void)setWorksheet:(FSWorksheet*)aWorksheet;
- (FSTableView*)tableView;
- (FSTable*)table;
- (void)setTable:(FSTable*)table;
- (void)syncWithDocument;

- (void)setPageHeaders:(NSArray*)headers;
- (void)setRightHeaders:(NSArray*)headers;
- (void)setTopHeaders:(NSArray*)headers;
- (void)setSideHeaders:(NSArray*)headers;

- (void)createHeaderSets;

- (void)updateDisplay;

- (NSDictionary*)layoutDictionary;
- (void)applyLayoutDictionary:(NSDictionary*)dict;

- (NSString *)name;
- (void)setName:(NSString*)name;

// Overwritten by subclasses to handle layout parameters
- (void)_cacheLayout;
- (void)_storeLayout;

// Notification callbacks
- (void)tableWillChange:(NSNotification*)notification;
- (void)tableDidChange:(NSNotification*)notification;
- (void)valueDidChange:(NSNotification*)notification;

@end


@interface FSWindowController (FSFirstResponder)

- (void)insertItem:(id)sender;
- (BOOL)validateUserInterfaceItem:(id <NSValidatedUserInterfaceItem>)anItem;

@end


@interface FSWindowController (FSTableDataSource)

- (NSArray*)pageHeadersForTableView:(FSTableView*)tv;
- (NSArray*)rightHeadersForTableView:(FSTableView*)tv;
- (NSArray*)topHeadersForTableView:(FSTableView*)tv;
- (NSArray*)sideHeadersForTableView:(FSTableView*)tv;

- (NSArray*)pageKeySetsForTableView:(FSTableView*)tv;
- (NSArray*)rightKeySetsForTableView:(FSTableView*)tv;
- (NSArray*)topKeySetsForTableView:(FSTableView*)tv;
- (NSArray*)sideKeySetsForTableView:(FSTableView*)tv;

- (id)tableView:(FSTableView*)tv objectForKeySet:(FSKeySet*)aKeySet;
- (id)tableView:(FSTableView*)tv setObject:(id)anObject forKeySet:(FSKeySet*)aKeySet;

- (BOOL)tableShouldBecomeFirstResponder;

- (NSFont*)defaultFont;

@end
