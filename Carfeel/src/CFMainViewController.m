//
//  CFViewController.m
//  TestSideMenu2
//
//  Created by James Yu on 4/20/13.
//  Copyright (c) 2013 Jianqiang Yu. All rights reserved.
//

#import "CFMainViewController.h"
#import "IIViewDeckController.h"
#import "UIViewController+MJPopupViewController.h"
#import "CFReportViewController.h"
#import "BMapKit.h"

@interface CFMainViewController ()

@end

@implementation CFMainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    BMKMapView* mapView = [[BMKMapView alloc]initWithFrame:self.view.frame];
    self.view = mapView ;
    NSLog(@"%@", NSStringFromCGRect(self.view.frame));
    
    CGRect btnRect = CGRectMake(0.f, self.view.frame.size.height-50.f, 50.f, 50.f);
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame = btnRect;
    btn.tag = 0;
    [btn setTitle:@"L" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(switchView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    btnRect = CGRectMake(self.view.frame.size.width-50.f, self.view.frame.size.height-50.f, 50.f, 50.f);
    btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame = btnRect;
    btn.tag = 1;
    [btn setTitle:@"R" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(popView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
}

- (void)viewWillAppear:(BOOL)animated
{
//
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)switchView:(UIButton *)sender
{
    [self.viewDeckController openLeftView];
}

- (IBAction)popView:(UIButton *)sender
{
    CFReportViewController *reportViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ReportViewController"];
    CGRect frame = CGRectMake(0.f, 0.f, 276.f, 276.f);
    reportViewController.view.frame = frame;
    
    
    [self presentPopupViewController:reportViewController animationType:MJPopupViewAnimationSlideRightRight];
}

@end
