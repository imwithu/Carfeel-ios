//
//  CFFeedNews.m
//  Carfeel
//
//  Created by James Yu on 4/24/13.
//  Copyright (c) 2013 Jianqiang Yu. All rights reserved.
//

#import "CFFeedNews.h"

@interface CFFeedNews ()
@property (nonatomic, readwrite, assign) CFFeedNewsType feedNewsType;
@property (nonatomic, readwrite, assign) CFFeedNewsStatus feedNewsStatus;
@property (nonatomic, readwrite, strong) NSString *description;
@property (nonatomic, readwrite, strong) UIImage *picture;
@property (nonatomic, readwrite, assign) CFUID owner;

@end

@implementation CFFeedNews

@synthesize feedNewsType = _feedNewsType;
@synthesize feedNewsStatus = _feedNewsStatus;
@synthesize description = _description;
@synthesize picture = _picture;
@synthesize owner = _owner;
@synthesize parent = _parent;
@synthesize children = _children;
@synthesize location = _location;


- (void)initWithDescription:(NSString *)description type:(CFFeedNewsType)feedNewsType status:(CFFeedNewsStatus)feedNewsStatus
{
    self.description = description;
    self.feedNewsType = feedNewsType;
    self.feedNewsStatus = feedNewsStatus;
}

- (void)reply:(CFFeedNews *)reply
{
    if (reply) {
        [self.children addObject:reply];
    }

}

@end
