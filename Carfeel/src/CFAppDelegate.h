//
//  CFAppDelegate.h
//  Carfeel
//
//  Created by James Yu on 4/23/13.
//  Copyright (c) 2013 Jianqiang Yu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BMapKit.h"

@interface CFAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) BMKMapManager *baiduMapManager;

@end
