//
//  CFAddress.h
//  Carfeel
//
//  Created by James Yu on 4/26/13.
//  Copyright (c) 2013 Jianqiang Yu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BMapKit.h"

@interface CFAddress : NSObject

@property (nonatomic, strong) NSString *province;  // 省份
@property (nonatomic, strong) NSString *city;      // 城市
@property (nonatomic, strong) NSString *street;    // 街道
@property (nonatomic, strong) NSString *zipcode;   // 邮政编码
@property (nonatomic, strong) CLLocation *location; // 地理位置

@end
