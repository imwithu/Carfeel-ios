//
//  CFLeftViewController.m
//  TestSideMenu2
//
//  Created by James Yu on 4/20/13.
//  Copyright (c) 2013 Jianqiang Yu. All rights reserved.
//

#import "CFLeftViewController.h"
#import "IIViewDeckController.h"
#import "CFPersonalInfoViewController.h"

@interface CFLeftViewController () <IIViewDeckControllerDelegate>

@property (nonatomic,strong) UISwitch *driverSwitch;
@property (nonatomic,strong) UISwitch *muteSwitch;

@end

@implementation CFLeftViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger rowNumber = 0;
    switch (section) {
        case 0:
            rowNumber = 1;
            break;
        case 1:
            rowNumber = 2;
            break;
        case 2:
            rowNumber = 1;
            break;
        case 3:
            rowNumber = 4;
            break;
        case 4:
            rowNumber = 2;
            break;
        default:
            break;
    }
    
    return rowNumber;
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *title =nil;
    
    switch (section) {
        case 0:
            title = @"";
            break;
        case 1:
            title = @"快速设置";
            break;
        case 2:
            title = @"好友列表";
            break;
        case 3:
            title = @"账号信息";
            break;
        case 4:
            title = @"路线信息";
        default:
            break;
    }
    
    return title;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{    
    CGRect sideRect = self.view.frame;
    sideRect.size.width = self.viewDeckController.leftViewSize;
    self.view.frame = sideRect;
    
    NSString *CellIdentifier = [NSString stringWithFormat:@"LeftCell-%d-%d",indexPath.section, indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	if (!cell) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    
        switch (indexPath.section) {
            case 0:
                if (indexPath.row == 0) {
                    cell.textLabel.text = @"主页";
                    cell.selectionStyle = UITableViewCellSelectionStyleGray;
                }
                break;
            case 1:
                //Set section header/footer here
                switch (indexPath.row) {
                    case 0:
                    {
                        cell.textLabel.text = @"驾驶模式";
                        cell.selectionStyle = UITableViewCellSelectionStyleNone;
                        if (!self.driverSwitch) {
                            CGRect drsRect = cell.frame;
                            drsRect.origin.x += 170.f;
                            drsRect.origin.y += 8.f;
                            self.driverSwitch = [[UISwitch alloc] initWithFrame:drsRect];
                            self.driverSwitch.on = YES;
                            [cell addSubview:self.driverSwitch];
                        }
                    }
                        break;
                        
                    case 1:
                    {
                        cell.textLabel.text = @"静音模式";
                        cell.selectionStyle = UITableViewCellSelectionStyleNone;
                        if (!self.muteSwitch) {
                            CGRect drsRect = cell.frame;
                            drsRect.origin.x += 170.f;
                            drsRect.origin.y += 8.f;
                            self.muteSwitch = [[UISwitch alloc] initWithFrame:drsRect];
                            self.muteSwitch.on = NO;
                            [cell addSubview:self.muteSwitch];
                        }
                        
                    }
                        break;
                    default:
                        break;
                }
                break;
            case 2:
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                cell.selectionStyle = UITableViewCellSelectionStyleGray;

                cell.textLabel.text = @"好友列表";
                break;
            case 3:
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                cell.selectionStyle = UITableViewCellSelectionStyleGray;
                switch (indexPath.row) {
                    case 0:
                        cell.textLabel.text = @"账户信息";
                        break;
                    case 1:
                        cell.textLabel.text = @"联系信息";
                        break;
                    case 2:
                        cell.textLabel.text = @"身份信息";
                        break;
                    case 3:
                        cell.textLabel.text = @"车辆信息";
                        break;
                    default:
                        break;
                }
                break;
            case 4:
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                cell.selectionStyle = UITableViewCellSelectionStyleGray;
                switch (indexPath.row) {
                    case 0:
                        cell.textLabel.text = @"常用线路";
                        break;
                    case 1:
                        cell.textLabel.text = @"临时线路";
                        break;
                    default:
                        break;
                }
                break;
                
            default:
                break;
        }
    }
    return cell;
}



/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
        case 0:
            [tableView deselectRowAtIndexPath:indexPath animated:YES];
            [self.viewDeckController toggleLeftViewAnimated:YES];
            self.viewDeckController.centerController = [self.storyboard instantiateViewControllerWithIdentifier:@"MainViewController"];

            break;
        case 1:
            break;
        case 2:
        {
            UINavigationController *pivc = [self.storyboard instantiateViewControllerWithIdentifier:@"FriendListNavigationController"];
            self.viewDeckController.centerController = pivc;
            
            [self.viewDeckController toggleLeftViewAnimated:YES];
        }
            break;
        case 3:
            break;
        case 4:
            break;
        default:
            break;
    }
    if (indexPath.section == 1) {
    }
}

@end
