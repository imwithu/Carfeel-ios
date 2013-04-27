//
//  CFDriveLicense.h
//  Carfeel
//
//  Created by James Yu on 4/27/13.
//  Copyright (c) 2013 Jianqiang Yu. All rights reserved.
//

#import "CFIdentifier.h"

enum {
    CFDriveLicenseTypeA1 = 0,
    CFDriveLicenseTypeA2,
    CFDriveLicenseTypeA3,
    CFDriveLicenseTypeB1,
    CFDriveLicenseTypeB2,
    CFDriveLicenseTypeC1,
    CFDriveLicenseTypeC2,
    CFDriveLicenseTypeC3,
    CFDriveLicenseTypeC4,
    CFDriveLicenseTypeC5,
    CFDriveLicenseTypeD,
    CFDriveLicenseTypeE,
    CFDriveLicenseTypeF,
    CFDriveLicenseTypeM,
    CFDriveLicenseTypeN,
    CFDriveLicenseTypeP
};
typedef UInt32 CFDriveLicenseType;

@interface CFDriveLicense : CFIdentifier

@property (nonatomic, readonly) CFDriveLicenseType licenseType;

@end
