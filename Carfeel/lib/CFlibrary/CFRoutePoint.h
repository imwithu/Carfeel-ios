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

@property (strong, nonatomic, readonly) NSString *name;
@property (strong, nonatomic, readonly) NSString *description;
@property (strong, nonatomic, readonly) NSURL *reference;
@property (strong, nonatomic, readonly) NSDate *crossTime;
@property (strong, nonatomic, readonly) CLLocation *location;


@end
