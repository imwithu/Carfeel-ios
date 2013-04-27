//
//  CFRouter.h
//  Carfeel
//
//  Created by James Yu on 4/24/13.
//  Copyright (c) 2013 Jianqiang Yu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CFRoutePoint.h"

@interface CFRouter : NSObject

@property (strong, nonatomic) CFRoutePoint *startStation;
@property (strong, nonatomic) CFRoutePoint *endStation;
@property (strong, nonatomic) NSMutableArray *crossStation;  //途径点，是一个可变数组，类型为CFRoutePoint


@end
