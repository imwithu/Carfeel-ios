//
//  CFUser.h
//  Carfeel
//
//  Created by James Yu on 4/27/13.
//  Copyright (c) 2013 Jianqiang Yu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CFUtil.h"
#import "CFBaseInformation.h"
#import "CFContact.h"
#import "CFRouter.h"
#import "BMapKit.h"


enum  {
    CFUserStatusNomal = 0,
    CFUserStatusDisable,
    CFUserStatusDeleted,
};
typedef UInt32 CFUserStatus;

@interface CFUser : NSObject

@property (nonatomic, readonly) CFUID uid;
@property (nonatomic, strong) CLLocation *location;

@property (nonatomic, strong) CFBaseInformation *baseInformation;
@property (nonatomic, strong) CFContact *contact;
@property (nonatomic, strong) NSMutableArray *socials;
@property (nonatomic, strong) NSMutableArray *friendList;
@property (nonatomic, strong) CFRouter *normalRouter;
@property (nonatomic, strong) CFRouter *tempRouter;

@property (nonatomic, strong, readonly) NSDate *registerDate;
@property (nonatomic, strong) NSDate *modificationDate;

@end
