//
//  CFContact.h
//  Carfeel
//
//  Created by James Yu on 4/26/13.
//  Copyright (c) 2013 Jianqiang Yu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CFAddress.h"

@interface CFContact : NSObject

@property (nonatomic, strong) NSString *email;
@property (nonatomic, strong) NSString *phone;
@property (nonatomic) BOOL emailVilidated;
@property (nonatomic) BOOL phoneVilidated;

@property (nonatomic, strong) CFAddress *homeAddress;
@property (nonatomic, strong) CFAddress *compAddress;

@end
