//
//  AppDelegate.m
//  BitHexConertTool
//
//  Created by Elliott on 14-8-21.
//  Copyright (c) 2014年 xujialiang. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    
    self.txt_0.delegate=self;
    self.txt_1.delegate=self;
    self.txt_2.delegate=self;
    self.txt_3.delegate=self;
    self.txt_4.delegate=self;
    self.txt_5.delegate=self;
    self.txt_6.delegate=self;
    self.txt_7.delegate=self;
    
}

- (void)controlTextDidChange:(NSNotification *)notification {
    NSTextField *textField = [notification object];
    if (textField.stringValue.length!=2) {
        return;
    }
    NSString *binstr;
    NSView *view;
    int diff=0;
    if (textField.tag==100) {
        binstr=self.txt_0.stringValue;
        view=self.group1;
        diff=0;
    }else if (textField.tag==200){
        binstr=self.txt_1.stringValue;
        view=self.group2;
        diff=8;
    }else if (textField.tag==300){
        binstr=self.txt_2.stringValue;
        view=self.group3;
        diff=16;
    }else if (textField.tag==400){
        binstr=self.txt_3.stringValue;
        view=self.group4;
        diff=24;
    }else if (textField.tag==500){
        binstr=self.txt_4.stringValue;
        view=self.group5;
        diff=32;
    }else if (textField.tag==600){
        binstr=self.txt_5.stringValue;
        view=self.group6;
        diff=40;
    }else if (textField.tag==700){
        binstr=self.txt_6.stringValue;
        view=self.group7;
        diff=48;
    }else if (textField.tag==800){
        binstr=self.txt_7.stringValue;
        view=self.group8;
        diff=56;
    }
    binstr=[self getBinaryByhex:binstr];
    for (int i=0; i<=7; i++) {
        NSRange range=NSMakeRange(i, 1);
        NSString *bit=[binstr substringWithRange:range];
        int tag=diff+i;
        NSButton *btn=[view viewWithTag:tag];
        [btn setStringValue:bit];
    }
    self.txt_result.stringValue=[NSString stringWithFormat:@"%@%@%@%@%@%@%@%@",self.txt_0.stringValue,self.txt_1.stringValue,self.txt_2.stringValue,self.txt_3.stringValue,self.txt_4.stringValue,self.txt_5.stringValue,self.txt_6.stringValue,self.txt_7.stringValue];
}

- (IBAction)checkboxAction:(id)sender {
    NSButton *btn=(NSButton *)sender;
    //第一组
    if (btn.tag>=0 && btn.tag<=7) {
        self.txt_0.stringValue=@"";
        self.txt_0.stringValue=[self CommonConvert:0];
    }else if (btn.tag>=8 && btn.tag<=15){
        self.txt_1.stringValue=@"";
        self.txt_1.stringValue=[self CommonConvert:1];
    }else if (btn.tag>=16 && btn.tag<=23){
        self.txt_2.stringValue=@"";
        self.txt_2.stringValue=[self CommonConvert:2];
    }else if (btn.tag>=24 && btn.tag<=31){
        self.txt_3.stringValue=@"";
        self.txt_3.stringValue=[self CommonConvert:3];
    }else if (btn.tag>=32 && btn.tag<=39){
        self.txt_4.stringValue=@"";
        self.txt_4.stringValue=[self CommonConvert:4];
    }else if (btn.tag>=40 && btn.tag<=47){
        self.txt_5.stringValue=@"";
        self.txt_5.stringValue=[self CommonConvert:5];
    }else if (btn.tag>=48 && btn.tag<=55){
        self.txt_6.stringValue=@"";
        self.txt_6.stringValue=[self CommonConvert:6];
    }else if (btn.tag>=56 && btn.tag<=63){
        self.txt_7.stringValue=@"";
        self.txt_7.stringValue=[self CommonConvert:7];
    }
    self.txt_result.stringValue=[NSString stringWithFormat:@"%@%@%@%@%@%@%@%@",self.txt_0.stringValue,self.txt_1.stringValue,self.txt_2.stringValue,self.txt_3.stringValue,self.txt_4.stringValue,self.txt_5.stringValue,self.txt_6.stringValue,self.txt_7.stringValue];
    
}

-(NSString *)CommonConvert:(NSInteger)group{
    int min;
    int max;
    NSView *view;
    if (group==0) {
        min=0;
        max=7;
        view=self.group1;
    }else if (group==1){
        min=8;
        max=15;
        view=self.group2;
    }else if (group==2){
        min=16;
        max=23;
        view=self.group3;
    }else if (group==3){
        min=24;
        max=31;
        view=self.group4;
    }else if (group==4){
        min=32;
        max=39;
        view=self.group5;
    }else if (group==5){
        min=40;
        max=47;
        view=self.group6;
    }else if (group==6){
        min=48;
        max=55;
        view=self.group7;
    }else if (group==7){
        min=56;
        max=63;
        view=self.group8;
    }
    
    NSString *hexstr=@"";
    NSString *strbinH=@"";
    NSString *strbinL=@"";
    for (int i=min; i<=max-4; i++) {
        NSButton *btnchk= [view viewWithTag:i];
        strbinH=[strbinH stringByAppendingString:btnchk.stringValue];
    }
    NSString *hexval=[self getHexByBinary:strbinH];
    hexstr=[hexstr stringByAppendingString:hexval];
    for (int i=max-3; i<=max; i++) {
        NSButton *btnchk= [view viewWithTag:i];
        strbinL=[strbinL stringByAppendingString:btnchk.stringValue];
    }
    hexval=[self getHexByBinary:strbinL];
    hexstr=[hexstr stringByAppendingString:hexval];
    return hexstr;
}

-(NSString *)getHexByBinary:(NSString *)binary{
    NSMutableDictionary  *binDic = [[NSMutableDictionary alloc] init];
    binDic = [[NSMutableDictionary alloc] initWithCapacity:16];
    [binDic setObject:@"0" forKey:@"0000"];
    [binDic setObject:@"1" forKey:@"0001"];
    [binDic setObject:@"2" forKey:@"0010"];
    [binDic setObject:@"3" forKey:@"0011"];
    [binDic setObject:@"4" forKey:@"0100"];
    [binDic setObject:@"5" forKey:@"0101"];
    [binDic setObject:@"6" forKey:@"0110"];
    [binDic setObject:@"7" forKey:@"0111"];
    [binDic setObject:@"8" forKey:@"1000"];
    [binDic setObject:@"9" forKey:@"1001"];
    [binDic setObject:@"A" forKey:@"1010"];
    [binDic setObject:@"B" forKey:@"1011"];
    [binDic setObject:@"C" forKey:@"1100"];
    [binDic setObject:@"D" forKey:@"1101"];
    [binDic setObject:@"E" forKey:@"1110"];
    [binDic setObject:@"F" forKey:@"1111"];
    
    return [binDic objectForKey:binary];
}

-(NSString *)getBinaryByhex:(NSString *)hex
{
    NSMutableDictionary  *hexDic = [[NSMutableDictionary alloc] init];
    hexDic = [[NSMutableDictionary alloc] initWithCapacity:16];
    [hexDic setObject:@"0000" forKey:@"0"];
    [hexDic setObject:@"0001" forKey:@"1"];
    [hexDic setObject:@"0010" forKey:@"2"];
    [hexDic setObject:@"0011" forKey:@"3"];
    [hexDic setObject:@"0100" forKey:@"4"];
    [hexDic setObject:@"0101" forKey:@"5"];
    [hexDic setObject:@"0110" forKey:@"6"];
    [hexDic setObject:@"0111" forKey:@"7"];
    [hexDic setObject:@"1000" forKey:@"8"];
    [hexDic setObject:@"1001" forKey:@"9"];
    [hexDic setObject:@"1010" forKey:@"A"];
    [hexDic setObject:@"1011" forKey:@"B"];
    [hexDic setObject:@"1100" forKey:@"C"];
    [hexDic setObject:@"1101" forKey:@"D"];
    [hexDic setObject:@"1110" forKey:@"E"];
    [hexDic setObject:@"1111" forKey:@"F"];
    
    NSMutableString *binaryString=[[NSMutableString alloc] init];
    for (int i=0; i<[hex length]; i++) {
        NSRange rage;
        rage.length = 1;
        rage.location = i;
        NSString *key = [hex substringWithRange:rage];
        //NSLog(@"%@",[NSString stringWithFormat:@"%@",[hexDic objectForKey:key]]);
        binaryString = [NSString stringWithFormat:@"%@%@",binaryString,[NSString stringWithFormat:@"%@",[hexDic objectForKey:key]]];
    }
    
    //NSLog(@"转化后的二进制为:%@",binaryString);
    
    return binaryString;
    
}

- (IBAction)btnCopy:(id)sender {
    NSPasteboard *pb = [NSPasteboard generalPasteboard];
    [self writeToPasteboard:pb withString:self.txt_result.stringValue];
}
- (void)writeToPasteboard:(NSPasteboard *)pb withString:string{
    [pb declareTypes:[NSArray arrayWithObject:NSStringPboardType]
               owner:self];
    [pb setString:string forType:NSStringPboardType];
}
@end
