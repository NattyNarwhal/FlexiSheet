//
//  FSPasteboardHandling.h
//  FlexiSheet
//
//  Created by Stefan Leuker on 01-DEC-2001.
//  Copyright (c) 2001-2003 Stefan Leuker. All rights reserved.
//
//  $Id$

#import <FSCore/FSKeyGroup.h>


@interface FSKeyGroup (PasteboardHandling)

- (BOOL)cutRange:(NSRange)range;
- (BOOL)copyRange:(NSRange)range;
- (int)pasteAtIndex:(int)index;

@end

//
// Pasteboard type
//

extern NSString* FSTableDataPboardType;
extern NSString* FSTableItemPboardType;
extern NSString *FSFormulaPboardType;
