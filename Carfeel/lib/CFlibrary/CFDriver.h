//
//  CFDriver.h
//  Carfeel
//
//  Created by James Yu on 4/27/13.
//  Copyright (c) 2013 Jianqiang Yu. All rights reserved.
//

#import "CFGuest.h"
#import "CFVehicle.h"

@interface CFDriver : CFGuest

@property (nonatomic, strong) NSMutableArray *vehicles;

@end
