//
//  AppDelegate.h
//  BitHexConertTool
//
//  Created by Elliott on 14-8-21.
//  Copyright (c) 2014年 xujialiang. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate,NSTextFieldDelegate>
@property (weak) IBOutlet NSView *group1;
@property (weak) IBOutlet NSView *group2;
@property (weak) IBOutlet NSView *group3;
@property (weak) IBOutlet NSView *group4;
@property (weak) IBOutlet NSView *group5;
@property (weak) IBOutlet NSView *group6;
@property (weak) IBOutlet NSView *group7;
@property (weak) IBOutlet NSView *group8;

@property (assign) IBOutlet NSWindow *window;

@property (weak) IBOutlet NSTextField *txt_0;
@property (weak) IBOutlet NSTextField *txt_1;
@property (weak) IBOutlet NSTextField *txt_2;
@property (weak) IBOutlet NSTextField *txt_3;
@property (weak) IBOutlet NSTextField *txt_4;
@property (weak) IBOutlet NSTextField *txt_5;
@property (weak) IBOutlet NSTextField *txt_6;
@property (weak) IBOutlet NSTextField *txt_7;
- (IBAction)checkboxAction:(id)sender;
@property (weak) IBOutlet NSTextField *txt_result;
- (IBAction)btnCopy:(id)sender;

@end
