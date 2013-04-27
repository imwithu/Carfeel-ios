//
//  CFReportViewController.m
//  Carfeel
//
//  Created by James Yu on 4/27/13.
//  Copyright (c) 2013 Jianqiang Yu. All rights reserved.
//

#import "CFReportViewController.h"
#import "IIViewDeckController.h"

@interface CFReportViewController ()

@end

@implementation CFReportViewController


- (id) initWithReportType:(CFFeedNewsType)type
{
//self = [super initWithNibName:@"ReportViewController" bundle:nil];
    switch (type) {
        case CFFeedNewsTypeTrafficJam:  //拥堵
            // do something
            break;
        
        case CFFeedNewsTypePolice:  // 警察
            break;
        
        case CFFeedNewsTypeAccident: // 事故
            break;
        
        case CFFeedNewsTypeConstruction: // 施工
            break;
        
        case CFFeedNewsTypeControl: // 管制
            break;
            
        case CFFeedNewsTypeInformation: // 见闻
            break;
            
        case CFFeedNewsTypeExposure: // 曝光
            break;
            
        default:
            break;
    }
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

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

@end
