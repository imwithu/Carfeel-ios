//
//  CFSocial.m
//  Carfeel
//
//  Created by James Yu on 4/24/13.
//  Copyright (c) 2013 Jianqiang Yu. All rights reserved.
//

#import "CFSocial.h"

@interface CFSocial ()

@property (strong, nonatomic, readwrite) NSString *platform;
@property (strong, nonatomic, readwrite) NSString *identifier;
@property (strong, nonatomic, readwrite) NSString *apiKey;
@property (strong, nonatomic, readwrite) NSDate *date;

@end


@implementation CFSocial

@synthesize platform = _platform;
@synthesize identifier = _identifier;
@synthesize apiKey = _apiKey;
@synthesize date = _date;

- (CFSocial *)initWithPlatformName:(NSString *)platform identifier:(NSString *)identifier apiKey:(NSString *)apiKey
{
    if (!self) {
        self = [super init];
    }
    self.platform = platform;
    self.identifier = identifier;
    self.apiKey = apiKey;
    self.date = [NSDate date];
    
    return self;
}

@end
