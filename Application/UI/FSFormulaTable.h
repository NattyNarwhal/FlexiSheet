//
//  FSFormulaTable.h
//  FlexiSheet
//
//  Created by Stefan Leuker on 11-FEB-2002.
//  Copyright (c) 2002-2003 Stefan Leuker. All rights reserved.
//
//  $Id$

#import <AppKit/AppKit.h>


@interface FSFormulaTable : NSTableView {
    BOOL   _isEditing;
    BOOL   shouldDrawFocusRing;
    id     lastResp;
}

- (BOOL)isEditing;

@end
