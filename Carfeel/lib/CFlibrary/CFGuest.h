//
//  CFGuest.h
//  Carfeel
//
//  Created by James Yu on 4/27/13.
//  Copyright (c) 2013 Jianqiang Yu. All rights reserved.
//

#import "CFUser.h"
#import "CFDriveLicense.h"

@interface CFGuest : CFUser

@property (nonatomic, strong) CFIdentifier *identifiers;
@property (nonatomic, strong) CFDriveLicense *driveLicense;

@end
