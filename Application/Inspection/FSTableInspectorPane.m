//
//  FSTableInspectorPane.m
//  FlexiSheet
//
//  Created by Stefan Leuker on 15-DEC-2001.
//  Copyright (c) 2001-2003 Stefan Leuker. All rights reserved.
//
//  $Id$

#import "FSTableInspectorPane.h"

@implementation FSTableInspectorPane

+ (void)initialize
{
    [FSInspectorPane registerInspectorPane:self];
}


- (void)awakeFromNib
{
    [categories setTarget:self];
    [categories setDoubleAction:@selector(inspectCategory:)];
}


- (NSString*)paneNibName
{
    return @"TableInspector";
}


- (NSString*)inspectorName
{
    return @"Table";
}


- (NSString*)paneIdentifier
{
    return @"Table";
}


- (void)updateWithSelection:(id<FSInspectable>)selection
{
    if ([selection isKindOfClass:[FSTable class]]) {
        table = (FSTable*)selection;

        [nameField setStringValue:[table name]];
        [nameField setEditable:YES];
        [documentField setStringValue:[(FSDocument*)[table document] displayName]];
        [comments setString:@""];
        [comments replaceCharactersInRange:NSMakeRange(0,0) withRTF:[table comment]];
        [comments setEditable:YES];
    } else {
        table = nil;

        [nameField setStringValue:@"Invalid object"];
        [nameField setEditable:NO];
        [documentField setStringValue:@"Not available"];
        [comments setString:@""];
        [comments setEditable:NO];
    }
    [categories reloadData];
}


- (void)setTableName:sender
{
    [table setName:[sender stringValue]];
}


- (IBAction)inspectDocument:sender
{
    [[NSNotificationCenter defaultCenter] postNotificationName:FSSelectionDidChangeNotification
                                                        object:[table document]];
}


- (IBAction)inspectCategory:sender
{
    [[NSNotificationCenter defaultCenter] postNotificationName:FSSelectionDidChangeNotification
                                                        object:[[table headers] objectAtIndex:[sender selectedRow]]];
}

//
// TableDataSource
//

- (int)numberOfRowsInTableView:(NSTableView *)aTableView
{
    if (aTableView == categories) {
        return [[table headers] count];
    }
    return 0;
}


- (id)tableView:(NSTableView *)aTableView objectValueForTableColumn:(NSTableColumn *)column row:(int)row
{
    if (aTableView == categories) {
        return [[[table headers] objectAtIndex:row] label];
    }
    return @"";
}

@end


@implementation FSTableInspectorPane (TextDelegate)

- (void)textDidChange:(NSNotification *)notification
{
    NSRange everything = NSMakeRange(0, [[comments string] length]);
    [table setComment:[comments RTFFromRange:everything]];
}

@end
