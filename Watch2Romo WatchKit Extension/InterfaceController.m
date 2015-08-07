//
//  InterfaceController.m
//  Watch2Romo WatchKit Extension
//
//  Created by Ishihara Junya on 2015/08/07.
//  Copyright (c) 2015年 Tsukurusha. All rights reserved.
//

#import "InterfaceController.h"


@interface InterfaceController()

@end


@implementation InterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];

    // Configure interface objects here.
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

- (IBAction)forward {
    NSLog(@"forward");
    [WKInterfaceController openParentApplication:@{@"action":@"forward"} reply:^(NSDictionary *replyInfo, NSError *error) {
    }];
}

- (IBAction)right {
    NSLog(@"fright");
    [WKInterfaceController openParentApplication:@{@"action":@"right"} reply:^(NSDictionary *replyInfo, NSError *error) {
    }];
}

- (IBAction)left {
    NSLog(@"left");
    [WKInterfaceController openParentApplication:@{@"action":@"left"} reply:^(NSDictionary *replyInfo, NSError *error) {
    }];
}

- (IBAction)backward {
    NSLog(@"backward");
    [WKInterfaceController openParentApplication:@{@"action":@"backward"} reply:^(NSDictionary *replyInfo, NSError *error) {
    }];
}

- (IBAction)stop {
    NSLog(@"stop");
    [WKInterfaceController openParentApplication:@{@"action":@"stop"} reply:^(NSDictionary *replyInfo, NSError *error) {
    }];
}


@end



