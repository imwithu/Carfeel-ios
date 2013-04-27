//
//  CFBaseInformation.m
//  Carfeel
//
//  Created by James Yu on 4/26/13.
//  Copyright (c) 2013 Jianqiang Yu. All rights reserved.
//

#import "CFBaseInformation.h"

@interface CFBaseInformation ()

@property (nonatomic, strong, readwrite) NSString *userName;
@property (nonatomic, strong, readwrite) NSString *saltedPassword;
@property (nonatomic, strong, readwrite) NSString *displayName;
@property (nonatomic, strong, readwrite) UIImage *displayPicture;
@property (nonatomic, strong, readwrite) NSDate *creationDate;
@property (nonatomic, strong, readwrite) NSDate *modificationDate;


@end

@implementation CFBaseInformation


@end
