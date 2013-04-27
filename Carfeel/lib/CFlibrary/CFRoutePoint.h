//
//  CFRoutePoint.h
//  Carfeel
//
//  Created by James Yu on 4/24/13.
//  Copyright (c) 2013 Jianqiang Yu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BMapKit.h"

@interface CFRoutePoint : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *description;
@property (strong, nonatomic) NSURL *reference;
@property (strong, nonatomic) NSDate *crossTime;
@property (strong, nonatomic) CLLocation *location;


@end
