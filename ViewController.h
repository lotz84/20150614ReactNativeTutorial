//
//  ViewController.h
//  AwesomeProject
//
//  Created by Hirose Tatsuya on 2015/06/14.
//  Copyright (c) 2015年 Facebook. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RCTBridgeModule.h"

@interface ViewController : UIViewController<RCTBridgeModule>

@property (nonatomic, weak) RCTBridge *bridge;

@end
