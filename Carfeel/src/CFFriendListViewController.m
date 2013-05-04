//
//  CFFriendListViewController.m
//  TestSideMenu2
//
//  Created by James Yu on 4/22/13.
//  Copyright (c) 2013 Jianqiang Yu. All rights reserved.
//

#import "CFFriendListViewController.h"
#import "CFFriendDetailViewController.h"
#import "IIViewDeckController.h"
#import "CFFriend.h"

@interface CFFriendListViewController () <IIViewDeckControllerDelegate, UITableViewDelegate, UISearchDisplayDelegate>

@property (nonatomic, strong) NSMutableArray *onlineFriends;
@property (nonatomic, strong) NSMutableArray *offlineFriends;
@property (nonatomic, copy) NSDictionary *editedSelection;

@property (nonatomic, strong) NSMutableArray *filteredFriends;
@property (nonatomic, copy) NSString *savedSearchTerm;
@property (nonatomic) BOOL searchWasActive;
//@property (nonatomic, strong) UISearchDisplayController *searchController;

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
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"设置" style:UIBarButtonItemStyleBordered target:self.viewDeckController action:@selector(toggleLeftView)];
    [self getFriendListFromRemote];
    
    self.title = @"我的好友";
    
    self.filteredFriends = [NSMutableArray arrayWithCapacity:([self.onlineFriends count]+[self.offlineFriends count])];
  
    if (self.savedSearchTerm) {
        [self.searchDisplayController setActive:self.searchWasActive];
        [self.searchDisplayController.searchBar setText:self.savedSearchTerm];
        
        self.savedSearchTerm = nil;
    }
    [self.tableView reloadData];
    self.tableView.scrollEnabled = YES;
    /*
    UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    self.tableView.tableHeaderView = searchBar;
    self.searchController = [[UISearchDisplayController alloc] initWithSearchBar:searchBar contentsController:self];
    self.searchController.delegate = self;
    self.searchController.searchResultsDataSource = self;
*/
}

- (void)viewDidUnload
{
    self.filteredFriends = nil;
}

- (void)viewWillDisappear:(BOOL)animated
{
    self.searchWasActive = [self.searchDisplayController isActive];
    self.savedSearchTerm = [self.searchDisplayController.searchBar text];
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
    if (!self.offlineFriends) {
        self.offlineFriends = [[NSMutableArray alloc] init];
    }
    // send request
    // get result
    
    int friendNumber = 20;
    CFFriend *friend;

    for (int i=0; i < friendNumber; i++) {
        friend = [[CFFriend alloc] init];
        friend.friendStatus = i % 3;
        friend.friendID = i;
        friend.displayName = [NSString stringWithFormat:@"username-%d", i];
        friend.commentName = [NSString stringWithFormat:@"nickname-%d", i];
        friend.following = YES;
        friend.follower = YES;
        if (friend.friendStatus == CFFriendStatusOffline) {
            [self.offlineFriends addObject:friend];
        } else {
             [self.onlineFriends addObject:friend];
        }
    }
}


- (void)setEditedSelection: (NSDictionary *)dict
{
    if (![dict isEqual:self.editedSelection]){
        _editedSelection = dict;
        NSIndexPath *indexPath = dict[@"indexPath"];
        id newValue = dict[@"object"];
        if (indexPath.section == 0)
            [self.onlineFriends replaceObjectAtIndex:indexPath.row withObject:newValue];
        else
            [self.offlineFriends replaceObjectAtIndex:indexPath.row withObject:newValue];
        [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    if (tableView ==  self.searchDisplayController.searchResultsTableView)
        return 1;
    else
        return 2;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    if (tableView == self.searchDisplayController.searchResultsTableView)
        return [self.filteredFriends count];
    
    if (section == 0)
        return [self.onlineFriends count];
    else
        return [self.offlineFriends count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (tableView == self.searchDisplayController.searchResultsTableView)
        return nil;
    
    if (section == 0)
        return @"在线好友";
    else
        return @"离线好友";
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Friend";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    
    CFFriend *friend = nil;
    if (tableView == self.searchDisplayController.searchResultsTableView) 
        friend = [self.filteredFriends objectAtIndex:indexPath.row];
    else if (indexPath.section == 0) 
        friend = [self.onlineFriends objectAtIndex:indexPath.row];
    else
        friend = [self.offlineFriends objectAtIndex:indexPath.row];
    
    cell.textLabel.text = friend.commentName;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ - %@" , friend.displayName, (friend.friendStatus==CFFriendStatusOffline)? @"Offline" : (friend.friendStatus == CFFriendStatusDriving) ? @"Driving":@"Riding"];
    
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
// storyboard segue 的方法
- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    UIViewController *destination = segue.destinationViewController;
    if ([destination respondsToSelector:@selector(setDelegate:)]){
        [destination setValue:self forKey:@"delegate"];
    }
    if ([destination respondsToSelector:@selector(setSelection:)]) {
        NSIndexPath *indexPath =[self.tableView indexPathForCell:sender];
        id object = nil;
        if (indexPath.section == 0)
            object = self.onlineFriends[indexPath.row];
        else
            object = self.offlineFriends[indexPath.row];
        NSDictionary *selection = @{@"indexPath":indexPath,@"object":object};
        
        [destination setValue:selection forKey:@"selection"];
    }
}

// 直接写代码的方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    
    if (tableView != self.searchDisplayController.searchResultsTableView) {
        return;
    }
    
    CFFriendDetailViewController *detailViewController = [[CFFriendDetailViewController alloc] init];
    detailViewController.selection = @{@"indexPath":indexPath, @"object":self.filteredFriends[indexPath.row]};
                                
    NSLog(@"%@",[self.filteredFriends[indexPath.row] displayName]);
     // ...
     // Pass the selected object to the new view controller.
    [[self navigationController] pushViewController:detailViewController animated:YES];

}



#pragma mark -
#pragma mark Content filtering

- (void)filterContentForSearchText:(NSString *)searchText
{
    [self.filteredFriends removeAllObjects];
    
    for (CFFriend *friend in self.onlineFriends) {
        NSComparisonResult result1 = [friend.displayName compare:searchText options:(NSCaseInsensitiveSearch|NSDiacriticInsensitiveSearch) range:NSMakeRange(0, [searchText length])];
        NSComparisonResult result2 = [friend.commentName compare:searchText options:(NSCaseInsensitiveSearch|NSDiacriticInsensitiveSearch) range:NSMakeRange(0, [searchText length])];
        if (result1 == NSOrderedSame || result2 == NSOrderedSame) {
            [self.filteredFriends addObject:friend];
        }
    }
    for (CFFriend *friend in self.offlineFriends) {
        NSComparisonResult result1 = [friend.displayName compare:searchText options:(NSCaseInsensitiveSearch|NSDiacriticInsensitiveSearch) range:NSMakeRange(0, [searchText length])];
        NSComparisonResult result2 = [friend.commentName compare:searchText options:(NSCaseInsensitiveSearch|NSDiacriticInsensitiveSearch) range:NSMakeRange(0, [searchText length])];
        if (result1 == NSOrderedSame || result2 == NSOrderedSame) {
            [self.filteredFriends addObject:friend];
        }
    }
}


#pragma mark -
#pragma mark UISearchDisplayController Delegate Methods
- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    [self filterContentForSearchText:searchString];
    return YES;
}

@end
