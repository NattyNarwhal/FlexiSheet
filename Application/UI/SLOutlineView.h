//
//  SLOutlineView.h
//
//  Created by Stefan Leuker on Mon Sep 17 2001.
//  Copyright (c) 2001-2003 Stefan Leuker. All rights reserved.
//
//  $Id$

#import <AppKit/NSOutlineView.h>


@interface SLOutlineView : NSOutlineView
{
}

- (id)parentItemForItem:(id)child;
- (id)parentItemForRow:(int)row child:(unsigned int *)childIndexPointer;
- (id)parentItemForRow:(int)row indentLevel:(int)childLevel child:(unsigned int *)childIndexPointer;

@end
