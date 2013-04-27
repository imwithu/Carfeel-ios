//
//  CFIdentifier.h
//  Carfeel
//
//  Created by James Yu on 4/27/13.
//  Copyright (c) 2013 Jianqiang Yu. All rights reserved.
//

#import <Foundation/Foundation.h>

enum {
    CFIdentifierTypeIDCard = 0,
    CFIdentifierTypeOther,
};
typedef UInt32 CFIdentifierType;


enum {
    CFIdentifierStatusInactive = 0,
    CFIdentifierStatusActive,
};
typedef UInt32 CFIdentifierStatus;


@interface CFIdentifier : NSObject

@property (nonatomic, strong, readonly) NSString *name;
@property (nonatomic, strong, readonly) NSString *gender;
@property (nonatomic, strong, readonly) NSDate *birthday;
@property (nonatomic, readonly) CFIdentifierType IDtype;
@property (nonatomic, strong, readonly) NSString *IDNumber;
@property (nonatomic, strong, readonly) NSDate *issueDate;
@property (nonatomic, strong, readonly) NSDate *expirationDate;
@property (nonatomic, strong, readonly) UIImage *IDpicture;
@property (nonatomic, strong, readonly) NSDate *creationDate;
@property (nonatomic, strong, readonly) NSDate *modificationDate;


@end
