//
//  SongViewController.m
//  AtristApp
//
//  Created by pqj647 on 1/29/17.
//  Copyright © 2017 pqj647. All rights reserved.
//

#import "SongViewController.h"
#import "ArtistFacade.h"
#import "NSArray+SongsTableRepresentation.h"

@interface SongViewController ()

@end

@implementation SongViewController

- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self == [super initWithCoder:aDecoder]) {
        //resArray = [NSArray arrayWithObjects:@"Egg Benedict", @"Mushroom Risotto", @"Full Breakfast", @"Hamburger", @"Ham and Egg Sandwich", @"Creme Brelee", @"White Chocolate Donut", @"Starbucks Coffee", @"Vegetable Curry", @"Instant Noodle with Egg", @"Noodle with BBQ Pork", @"Japanese Noodle with Pork", @"Green Tea", @"Thai Shrimp Cake", @"Angry Birds Cake", @"Ham and Cheese Panini", nil];;
        resArray = [[NSArray alloc] init];
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //UIApplication.sharedApplication().networkActivityIndicatorVisible = false
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    [[ArtistFacade getSharedInstance] callArtistService:^(NSArray *resultArray, NSError *error) {
        resArray = resultArray;
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        [self.tableView reloadData];
    }];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    if ([resArray count] > 0) {
        return [resArray count];
    } else {
        return 0;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifierAction = @"SongCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifierAction forIndexPath:indexPath];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifierAction];
    }
    
    cell.textLabel.text = [resArray getSongName:indexPath.row];
    return cell;
    
    /****
     static NSString *CellIdentifier = @"SymbologyCell";
     zt_SwitchTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
     
     if (cell == nil)
     {
     cell = [[zt_SwitchTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
     }
     
     [cell setIndex:(int)[indexPath row]];
     [cell setDelegate:self];
     zt_Symbology *sym = [m_Symbologies objectAtIndex:[indexPath row]];
     cell.cellTitle.text = [sym getSymbologyName];
     [cell.cellSwitch setEnabled:[sym isSupported]];
     [cell setSwitchOn:[sym isEnabled]];
     
     return cell;
     
     ******/
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
