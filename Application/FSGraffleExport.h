//
//  FSGraffleExport.h
//  FlexiSheet
//
//  Created by Stefan Leuker on 06-MAY-2002.
//  Copyright (c) 2001-2003 Stefan Leuker. All rights reserved.
//
//  $Id$

#import <Foundation/Foundation.h>


@interface FSGraffleExport : NSObject
{
    NSMutableDictionary *graffleDocument;
    NSMutableArray      *graffleObjects;
}

+ (FSGraffleExport*)graffleDocument;

- (BOOL)writeToFile:(NSString *)path atomically:(BOOL)useAuxiliaryFile;

@end
