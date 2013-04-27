//
//  CFSocial.h
//  Carfeel
//
//  Created by James Yu on 4/24/13.
//  Copyright (c) 2013 Jianqiang Yu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CFSocial : NSObject

@property (strong, nonatomic, readonly) NSString *platform;
@property (strong, nonatomic, readonly) NSString *identifier;
@property (strong, nonatomic, readonly) NSString *apiKey;
@property (strong, nonatomic, readonly) NSDate *creationDate;

- (CFSocial *)initWithPlatformName:(NSString *)platform identifier:(NSString *)identifier apiKey:(NSString *)apiKey;

@end
