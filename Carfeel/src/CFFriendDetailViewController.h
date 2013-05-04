//
//  CFFriendDetailViewController.h
//  Carfeel
//
//  Created by James Yu on 4/28/13.
//  Copyright (c) 2013 Jianqiang Yu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CFFriend.h"

@interface CFFriendDetailViewController : UITableViewController

@property (nonatomic, copy) NSDictionary *selection;
@property (nonatomic, weak) id delegate;

@end
