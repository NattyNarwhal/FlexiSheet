//
//  FSChartView.m
//  FlexiSheet
//
//  Created by Stefan Leuker on 20-OCT-2001.
//  Copyright (c) 2001-2003 Stefan Leuker. All rights reserved.
//
//  $Id$

#import "FSChartView.h"


@implementation FSChartView

- (id)initWithFrame:(NSRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code here.
    }
    return self;
}

- (void)drawRect:(NSRect)rect {
    NSRect     bounds = [self bounds];    
    
    [[NSColor controlColor] set];
    NSRectFill(bounds);
}

@end
