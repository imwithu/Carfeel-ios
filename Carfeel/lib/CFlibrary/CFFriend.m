//
//  CFFriend.m
//  Carfeel
//
//  Created by James Yu on 4/24/13.
//  Copyright (c) 2013 Jianqiang Yu. All rights reserved.
//

#import "CFFriend.h"

@implementation CFFriend

- (CFFriend *)init
{
    self = [super init];
    self.friendStatusString = [[NSArray alloc] initWithObjects:@"Offlie", @"Driving", @"Riding", nil];
    
    return self;
}

@end
