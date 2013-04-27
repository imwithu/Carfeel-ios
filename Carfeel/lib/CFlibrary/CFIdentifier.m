//
//  CFIdentifier.m
//  Carfeel
//
//  Created by James Yu on 4/27/13.
//  Copyright (c) 2013 Jianqiang Yu. All rights reserved.
//

#import "CFIdentifier.h"

@interface CFIdentifier ()

@property (nonatomic, strong, readwrite) NSString *name;
@property (nonatomic, strong, readwrite) NSString *gender;
@property (nonatomic, strong, readwrite) NSDate *birthday;
@property (nonatomic, readwrite) CFIdentifierType IDtype;
@property (nonatomic, strong, readwrite) NSString *IDNumber;
@property (nonatomic, strong, readwrite) NSDate *issueDate;
@property (nonatomic, strong, readwrite) NSDate *expirationDate;
@property (nonatomic, strong, readwrite) UIImage *IDpicture;
@property (nonatomic, strong, readwrite) NSDate *creationDate;
@property (nonatomic, strong, readwrite) NSDate *modificationDate;


@end


@implementation CFIdentifier

@end
