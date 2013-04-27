//
//  CFVehicle.h
//  Carfeel
//
//  Created by James Yu on 4/27/13.
//  Copyright (c) 2013 Jianqiang Yu. All rights reserved.
//

#import <Foundation/Foundation.h>

enum {
    CFVehicleStatusNomal = 0,
    CFVehicleStatusLimit,
    CFVehicleStatusDisable,
};
typedef UInt32 CFVehicleStatus;

@interface CFVehicle : NSObject

@property (nonatomic, strong, readonly) NSString *license;
@property (nonatomic, strong, readonly) NSString *engineNumber;
@property (nonatomic, readonly) int capacity;
@property (nonatomic, strong, readonly) UIColor *color;
@property (nonatomic, strong, readonly) UIImage *picture;
@property (nonatomic, strong, readonly) NSString *brand;
@property (nonatomic, strong, readonly) NSString *model;
@property (nonatomic, readonly, getter = hasEnsure) BOOL ensure;
@property (nonatomic, strong, readonly) NSDate *creationDate;
@property (nonatomic, strong, readonly) NSDate *modificationDate;
@property (nonatomic, readonly) CFVehicleStatus status;

@end
