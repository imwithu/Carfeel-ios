//
//  CFRoutePoint.m
//  Carfeel
//
//  Created by James Yu on 4/24/13.
//  Copyright (c) 2013 Jianqiang Yu. All rights reserved.
//

#import "CFRoutePoint.h"


@interface CFRoutePoint ()

@property (strong, nonatomic, readwrite) NSString *name;
@property (strong, nonatomic, readwrite) NSString *description;
@property (strong, nonatomic, readwrite) NSURL *reference;
@property (strong, nonatomic, readwrite) NSDate *crossTime;
@property (strong, nonatomic, readwrite) CLLocation *location;


@end


@implementation CFRoutePoint

@synthesize name = _name;
@synthesize description = _description;
@synthesize reference = _reference;
@synthesize crossTime = _crossTime;
@synthesize location = _location;

@end
