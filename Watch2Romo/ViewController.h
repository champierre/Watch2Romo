//
//  ViewController.h
//  Watch2Romo
//
//  Created by Ishihara Junya on 2015/08/07.
//  Copyright (c) 2015年 Tsukurusha. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <RMCore/RMCore.h>

@interface ViewController : UIViewController <RMCoreDelegate>

@property (nonatomic, strong) RMCoreRobot<HeadTiltProtocol, DriveProtocol, LEDProtocol> *robot;

@end

