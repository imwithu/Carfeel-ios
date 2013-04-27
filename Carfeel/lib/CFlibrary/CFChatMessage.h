//
//  CFChatMessage.h
//  Carfeel
//
//  Created by James Yu on 4/24/13.
//  Copyright (c) 2013 Jianqiang Yu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CFUtil.h"

@interface CFChatMessage : NSObject

@property (nonatomic, readonly, assign) CFUID fromUID;
@property (nonatomic, readonly, assign) CFUID toUID;
@property (nonatomic, readonly, strong) NSString *message;
@property (nonatomic, readonly, strong) NSDate *date;


- (void) initWithMessage:(NSString *)message from:(CFUID)from to:(CFUID)to;

@end
