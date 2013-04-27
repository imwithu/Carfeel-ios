//
//  CFRouter.m
//  Carfeel
//
//  Created by James Yu on 4/24/13.
//  Copyright (c) 2013 Jianqiang Yu. All rights reserved.
//

#import "CFRouter.h"

@implementation CFRouter

@synthesize startStation = _startStation;
@synthesize endStation = _endStation;
@synthesize crossStation = _crossStation;

- (CFRouter *)init
{
    if (!self) {
        self = [super init];
    }
    self.startStation = nil;
    self.endStation = nil;
    self.crossStation = nil;
    
    return self;
}

- (void)setStartTime:(NSDate *)startTime
{
    self.startStation.crossTime = startTime;
    
    if ([self.crossStation count] > 0) {
        //如果设置了途经点，则依次计算通过每一个途经点的大概时间
        [CFRouter calculateThroughTimeFromStartStation:self.startStation endStation:self.crossStation[0]];
        int i = 1;
        for ( ; i<[self.crossStation count]; i++) {
            [CFRouter calculateThroughTimeFromStartStation:self.crossStation[i-1] endStation:self.crossStation[i]];
        }
        [CFRouter calculateThroughTimeFromStartStation:self.crossStation[i-1] endStation:self.endStation];
    } else {
        //没有设置途径点，直接计算起点到终点的时间
        [CFRouter calculateThroughTimeFromStartStation:self.startStation endStation:self.endStation];
    }
}

+ (void)calculateThroughTimeFromStartStation:(CFRoutePoint *)start endStation:(CFRoutePoint *)end
{
    //计算两点之间的行使距离
    end.crossTime = start.crossTime;
}

@end
