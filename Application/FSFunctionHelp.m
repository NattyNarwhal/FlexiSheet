//
//  FSFunctionHelp.m
//  FlexiSheet
//
//  Created by Stefan Leuker on 17-OCT-2001.
//  Copyright (c) 2001-2003 Stefan Leuker. All rights reserved.
//
//  $Id$

#import "FSFunctionHelp.h"
#import "FSFunction.h"
#import "FSOperator.h"
#import <WebKit/WebView.h>
#import <WebKit/WebFrame.h>

@implementation FSFunctionHelp

- (void)_getNames
{
    int row = [groups selectedRowInColumn:0];
    if (row == 0) {
        [fNames release];
        fNames = [[FSOperator allOperatorSymbols] retain];
    } else {
        NSString *groupName = [[FSFunction allGroupNames] objectAtIndex:row-1];
        [fNames release];
        fNames = [[FSFunction allFunctionNamesInGroup:groupName] retain];        
    }
}

- (void)showPanel:(id)sender
{
    if (helpView == nil) {
        [NSBundle loadNibNamed:@"Functions" owner:self];
        [groups reloadColumn:0];
        [groups selectRow:0 inColumn:0];
        [self _getNames];
    }
    [[helpView window] orderFront:sender];
}

- (void)selectGroup:(id)sender
{
    [self _getNames];
    [functions reloadColumn:0];
}

- (void)selectFunction:(id)sender
{
    int       row = [sender selectedRowInColumn:0];
    NSString *name = (row >= 0)?[fNames objectAtIndex:row]:@"<no selection>";
    Class     class = [FSFunction functionClassForName:name];
    NSURL    *base = [FSFunction helpBaseURL];

    if (class == nil)
    {
        class = [FSOperator operatorClassForSymbol:name];
        base = [FSOperator helpBaseURL];
    }
    
    if (class == nil)
    {
        [[helpView mainFrame] loadHTMLString:@"Nothing selected" baseURL:nil];
    }
    else
    {
        [[helpView mainFrame] loadHTMLString:[class htmlHelpData] baseURL:nil];
    }
}

- (int)browser:(NSBrowser *)sender numberOfRowsInColumn:(int)column
{
    if (sender == groups) {
        return [[FSFunction allGroupNames] count]+1;
    } else
    if (sender == functions) {
        return [fNames count];
    }
    return 0;
}

- (void)browser:(NSBrowser *)sender willDisplayCell:(id)cell atRow:(int)row column:(int)column
{
    [cell setLeaf:YES];
    if (sender == groups) {
        if (row == 0) {
            [cell setStringValue:@"Operators"];
        } else {
            [cell setStringValue:[[FSFunction allGroupNames] objectAtIndex:row-1]];
        }
    } else
    if (sender == functions) {
        [cell setStringValue:[fNames objectAtIndex:row]];
    }
    [cell setLoaded:YES];
}

@end
