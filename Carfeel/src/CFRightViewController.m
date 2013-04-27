//
//  CFRightViewController.m
//  TestSideMenu2
//
//  Created by James Yu on 4/20/13.
//  Copyright (c) 2013 Jianqiang Yu. All rights reserved.
//

#import "CFRightViewController.h"
#import "IIViewDeckController.h"

@interface CFRightViewController () <IIViewDeckControllerDelegate>

@end

@implementation CFRightViewController

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
    // self.clearsSelectionOnViewWillAppear = YES;
    self.tableView.scrollEnabled = NO;  //右侧菜单不让滚动

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
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 7;
}

- (void)createReportButton:(UITableViewCell *)cell
{
    CGRect btnRect = cell.frame;
    btnRect.origin.x += 100.f;
    btnRect.origin.y += 5.f;
    btnRect.size.width = 60;
    btnRect.size.height = 35;
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame = btnRect;
    [btn setTitle:@"查看" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [cell addSubview:btn];
    btnRect.origin.x += 80;
    btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame = btnRect;
    [btn setTitle:@"报告" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [cell addSubview:btn];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGRect sideRect = self.view.frame;
    sideRect.size.width = self.viewDeckController.rightViewSize;
    sideRect.origin.x = self.viewDeckController.rightSize;
    self.view.frame = sideRect;
    
    static NSString *CellIdentifier = @"RightCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	if (!cell)
    {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.textLabel.textColor = [UIColor whiteColor];
        [self createReportButton:cell];
        if (indexPath.section == 0) {
            switch (indexPath.row) {
                case 0:
                {
                    cell.textLabel.text = @"拥堵";
                    
                }
                    break;
                case 1:
                {
                    cell.textLabel.text = @"警察";
                }
                    break;
                case 2:
                {
                    cell.textLabel.text = @"事故";
                }
                    break;
                case 3:
                {
                    cell.textLabel.text = @"施工";
                }
                    break;
                case 4:
                {
                    cell.textLabel.text = @"管制";
                }
                    break;
                case 5:
                {
                    cell.textLabel.text = @"趣闻";
                }
                    break;
                case 6:
                {
                    cell.textLabel.text = @"曝光";
                }
                    break;
                    
                default:
                    break;
            }
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
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
