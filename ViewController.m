//
//  ViewController.m
//  AwesomeProject
//
//  Created by Hirose Tatsuya on 2015/06/14.
//  Copyright (c) 2015年 Facebook. All rights reserved.
//

#import "ViewController.h"
#import "RCTRootView.h"

@implementation ViewController

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(fetch:(NSString *)urlString :(RCTResponseSenderBlock)callback)
{
  NSURL *url = [NSURL URLWithString:urlString];
  NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
  NSURLSession *session = [NSURLSession sessionWithConfiguration:config];
  
  NSURLSessionDataTask *task =
  [session dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    callback(@[dict]);
  }];
  
  [task resume];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  RCTRootView *rootView = [[RCTRootView alloc] initWithBridge:self.bridge moduleName:@"AwesomeProject"];
  self.view = rootView;
}

@end
