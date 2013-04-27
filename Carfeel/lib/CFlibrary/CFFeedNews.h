//
//  CFFeedNews.h
//  Carfeel
//
//  Created by James Yu on 4/24/13.
//  Copyright (c) 2013 Jianqiang Yu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CFUtil.h"
#import "CFRoutePoint.h"

@interface CFFeedNews : NSObject

enum {
    CFFeedNewsTypeTrafficJam = 0,
    CFFeedNewsTypePolice,
    CFFeedNewsTypeAccident,
    CFFeedNewsTypeConstruction,
    CFFeedNewsTypeControl,
    CFFeedNewsTypeInformation,
    CFFeedNewsTypeExposure,
};
typedef UInt32 CFFeedNewsType;

enum {
    CFFeedNewsStatusNormal = 0,
};
typedef UInt32 CFFeedNewsStatus;

@property (nonatomic, readonly, assign) CFFeedNewsType feedNewsType;
@property (nonatomic, readonly, assign) CFFeedNewsStatus feedNewsStatus;
@property (nonatomic, readonly, strong) NSString *description;
@property (nonatomic, readonly, strong) UIImage *picture;
@property (nonatomic, readonly, assign) CFUID owner;
@property (nonatomic, strong) CFFeedNews *parent;
@property (nonatomic, strong) NSMutableArray *children;
@property (nonatomic, strong) CFRoutePoint *location;


- (void)initWithDescription:(NSString *)description type:(CFFeedNewsType)feedNewsType status:(CFFeedNewsStatus)feedNewsStatus;
- (void)reply:(CFFeedNews *)reply;

@end
