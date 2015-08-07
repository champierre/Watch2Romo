//
//  ViewController.m
//  Watch2Romo
//
//  Created by Ishihara Junya on 2015/08/07.
//  Copyright (c) 2015年 Tsukurusha. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [RMCore setDelegate:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)robotDidConnect:(RMCoreRobot *)robot
{
    if (robot.isDrivable && robot.isHeadTiltable && robot.isLEDEquipped) {
        self.robot = (RMCoreRobot<HeadTiltProtocol, DriveProtocol, LEDProtocol> *) robot;
        
//        [self.robot.LEDs blinkWithPeriod:1.0
//                               dutyCycle:.4];
//        [self.robot driveWithRadius:RM_DRIVE_RADIUS_STRAIGHT
//                              speed:1.0];
    }
}

- (void)robotDidDisconnect:(RMCoreRobot *)robot
{
    if (robot == self.robot) {
        self.robot = nil;
    }
}

@end
