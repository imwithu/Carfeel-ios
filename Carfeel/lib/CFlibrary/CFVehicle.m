//
//  CFVehicle.m
//  Carfeel
//
//  Created by James Yu on 4/27/13.
//  Copyright (c) 2013 Jianqiang Yu. All rights reserved.
//

#import "CFVehicle.h"

@interface CFVehicle ()

@property (nonatomic, strong, readwrite) NSString *license;
@property (nonatomic, strong, readwrite) NSString *engineNumber;
@property (nonatomic, readwrite) int capacity;
@property (nonatomic, strong, readwrite) UIColor *color;
@property (nonatomic, strong, readwrite) UIImage *picture;
@property (nonatomic, strong, readwrite) NSString *brand;
@property (nonatomic, strong, readwrite) NSString *model;
@property (nonatomic, readwrite, getter = hasEnsure) BOOL ensure;
@property (nonatomic, strong, readwrite) NSDate *creationDate;
@property (nonatomic, strong, readwrite) NSDate *modificationDate;
@property (nonatomic, readwrite) CFVehicleStatus status;

@end


@implementation CFVehicle

@end
