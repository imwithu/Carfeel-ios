//
//  CFBaseInformation.h
//  Carfeel
//
//  Created by James Yu on 4/26/13.
//  Copyright (c) 2013 Jianqiang Yu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CFBaseInformation : NSObject

@property (nonatomic, strong, readonly) NSString *userName;
@property (nonatomic, strong, readonly) NSString *saltedPassword;
@property (nonatomic, strong, readonly) NSString *displayName;
@property (nonatomic, strong, readonly) UIImage *displayPicture;
@property (nonatomic, strong, readonly) NSDate *creationDate;
@property (nonatomic, strong, readonly) NSDate *modificationDate;

@end
