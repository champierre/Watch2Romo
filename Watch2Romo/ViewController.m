//
//  ViewController.m
//  Watch2Romo
//
//  Created by Ishihara Junya on 2015/08/07.
//  Copyright (c) 2015年 Tsukurusha. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    app.viewController = self;
    
    [RMCore setDelegate:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)robotDidConnect:(RMCoreRobot *)robot
{
    if (robot.isDrivable && robot.isHeadTiltable && robot.isLEDEquipped) {
        self.robot = (RMCoreRobotRomo3 *)robot;
    }
}

- (void)robotDidDisconnect:(RMCoreRobot *)robot
{
    if (robot == self.robot) {
        self.robot = nil;
    }
}

- (void)forward
{
    [self stop];
    NSLog(@"forward");
    // If Romo3 is driving, let's stop driving
    BOOL RomoIsDriving = (self.robot.leftDriveMotor.powerLevel != 0) || (self.robot.rightDriveMotor.powerLevel != 0);
    if (!RomoIsDriving) {
        // Change Romo's LED to pulse
        [self.robot.LEDs pulseWithPeriod:1.0 direction:RMCoreLEDPulseDirectionUpAndDown];
        
        // Romo's top speed is around 0.75 m/s
        float speedInMetersPerSecond = 0.5;
        
        // Give Romo the drive command
        [self.robot driveForwardWithSpeed: speedInMetersPerSecond];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 0.5 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
            [self stop];
        });
    }
}

- (void)right
{
    [self stop];
    NSLog(@"right");
    
    // If Romo3 is driving, let's stop driving
    BOOL RomoIsDriving = (self.robot.leftDriveMotor.powerLevel != 0) || (self.robot.rightDriveMotor.powerLevel != 0);
    if (!RomoIsDriving) {
        float radius = 0;
        
        // Give Romo the drive command
        [self.robot turnByAngle:-90 withRadius:radius completion:nil];
    }
}

- (void)left
{
    [self stop];
    NSLog(@"left");
    
    // If Romo3 is driving, let's stop driving
    BOOL RomoIsDriving = (self.robot.leftDriveMotor.powerLevel != 0) || (self.robot.rightDriveMotor.powerLevel != 0);
    if (!RomoIsDriving) {
        float radius = 0;
        
        // Give Romo the drive command
        [self.robot turnByAngle:90 withRadius:radius completion:nil];
    }
}

- (void)backward
{
    [self stop];
    NSLog(@"backward");
    // If Romo3 is driving, let's stop driving
    BOOL RomoIsDriving = (self.robot.leftDriveMotor.powerLevel != 0) || (self.robot.rightDriveMotor.powerLevel != 0);
    if (!RomoIsDriving) {
        // Change Romo's LED to pulse
        [self.robot.LEDs pulseWithPeriod:1.0 direction:RMCoreLEDPulseDirectionUpAndDown];
        
        // Romo's top speed is around 0.75 m/s
        float speedInMetersPerSecond = 0.5;
        
        // Give Romo the drive command
        [self.robot driveBackwardWithSpeed: speedInMetersPerSecond];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 0.5 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
            [self stop];
        });
    }
}

- (void)stop
{
    // If Romo3 is driving, let's stop driving
    BOOL RomoIsDriving = (self.robot.leftDriveMotor.powerLevel != 0) || (self.robot.rightDriveMotor.powerLevel != 0);
    if (RomoIsDriving) {
        // Change Romo's LED to be solid at 80% power
        [self.robot.LEDs setSolidWithBrightness:0.8];
        
        // Tell Romo3 to stop
        [self.robot stopDriving];
    }
}

@end
