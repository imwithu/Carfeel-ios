//
//  CFFriendListViewController.m
//  TestSideMenu2
//
//  Created by James Yu on 4/22/13.
//  Copyright (c) 2013 Jianqiang Yu. All rights reserved.
//

#import "CFFriendListViewController.h"
#import "IIViewDeckController.h"

@interface CFFriendListViewController () <IIViewDeckControllerDelegate>

@property (nonatomic, strong) NSMutableArray *onlineFriends;
@property (nonatomic, strong) NSMutableArray *offlineFriends;

@end

@implementation CFFriendListViewController

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
    self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    //self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    // set back button
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleBordered target:self.viewDeckController action:@selector(toggleLeftView)];
    [self getFriendListFromRemote];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (void)getFriendListFromRemote
{
    if (!self.onlineFriends) {
        self.onlineFriends = [[NSMutableArray alloc] init];
    }    
    NSDictionary *friend = @{@"Name":@"Jerry", @"Status":@"Online"};
    [self.onlineFriends addObject:friend];
    friend = @{@"Name":@"xPhone", @"Status":@"Online"};
    [self.onlineFriends addObject:friend];

    
    if (!self.offlineFriends) {
        self.offlineFriends = [[NSMutableArray alloc] init];
    }
    friend = @{@"Name":@"Zhang", @"Status":@"Offline"};
    [self.offlineFriends addObject:friend];
    friend = @{@"Name":@"Li", @"Status":@"Offline"};
    [self.offlineFriends addObject:friend];

}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    if (section == 0) {
        NSLog(@"%d", [self.onlineFriends count]);
        return [self.onlineFriends count];
    } else {
        NSLog(@"%d", [self.offlineFriends count]);
        return [self.offlineFriends count];
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *title =nil;
    
    switch (section) {
        case 0:
            title = @"在线好友";
            break;
        case 1:
            title = @"离线好友";
            break;
        default:
            break;
    }
    
    return title;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Friend";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    if (cell == nil) {
        NSLog(@"cell == nil");
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    NSLog(@"%@", indexPath);
    switch (indexPath.section) {
        case 0:
        {
            NSDictionary *friend = [self.onlineFriends objectAtIndex:indexPath.row];
            NSLog(@"%@",friend);
            cell.textLabel.text = [friend objectForKey:@"Name"];
            cell.detailTextLabel.text = [friend objectForKey:@"Status"];
        }
            break;
        case 1:
        {
            NSDictionary *friend = [self.offlineFriends objectAtIndex:indexPath.row];
            cell.textLabel.text = [friend objectForKey:@"Name"];
            cell.detailTextLabel.text = [friend objectForKey:@"Status"];
        }
            
            break;
        default:
            break;
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
