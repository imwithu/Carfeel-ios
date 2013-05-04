//
//  CFRootViewController.m
//  TestSideMenu2
//
//  Created by James Yu on 4/20/13.
//  Copyright (c) 2013 Jianqiang Yu. All rights reserved.
//

#import "CFRootViewController.h"

#import "IIViewDeckController.h"
#import "CFMainViewController.h"
#import "CFLeftViewController.h"
#import "CFRightViewController.h"


@interface CFRootViewController ()

@end

@implementation CFRootViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (id) initWithCoder:(NSCoder *)aDecoder
{
    NSLog(@"init storyboard");
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Carfeel" bundle:nil];
    
    NSLog(@"create 3 views");
    CFMainViewController *mainController = [storyboard instantiateViewControllerWithIdentifier:@"MainViewController"];
    CFLeftViewController *leftController = [storyboard instantiateViewControllerWithIdentifier:@"LeftViewController"];
//    CFRightViewController *rightController = [storyboard instantiateViewControllerWithIdentifier:@"RightViewController"];

    NSLog(@"create viewDeckController");
//    self = [super initWithCenterViewController:mainController leftViewController:leftController rightViewController:rightController];
    self = [super initWithCenterViewController:mainController leftViewController:leftController];
    if (self) {
        NSLog(@"set viewDeckController's proprity");
        self.panningMode = IIViewDeckNoPanning;
        self.centerhiddenInteractivity = IIViewDeckCenterHiddenNotUserInteractiveWithTapToClose;
        self.leftSize = 60;
        self.rightSize = 60;
        self.topSize = 0;
        self.bottomSize = 0;
    }    
    return self;
}

@end
