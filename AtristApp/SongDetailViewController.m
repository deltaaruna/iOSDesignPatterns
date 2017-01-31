//
//  SongDetailViewController.m
//  AtristApp
//
//  Created by pqj647 on 1/29/17.
//  Copyright © 2017 pqj647. All rights reserved.
//

#import "SongDetailViewController.h"
#import "SongDetailTextCell.h"
#import "SongDetailImageCell.h"
#import "SongDetails+TableRepresentation.h"
#import "AppHelper.h"
#import "PLazyLoadUIImageView.h"
#import "config.h"

@interface SongDetailViewController ()

@end

@implementation SongDetailViewController

- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self == [super initWithCoder:aDecoder]) {
        [[ArtistFacade getSharedInstance] addDownloadDelegate:self];
    }
    
    return self;
}

- (void)dealloc {
    [[ArtistFacade getSharedInstance] removeDownloadDelegate:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    imageName = nil;
    [self generateImageName];
    self.tableView.estimatedRowHeight = 300;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:90
                                             target: self
                                           selector: @selector(checkConnectivity:)
                                           userInfo: nil
                                            repeats: YES];
}

- (void)checkConnectivity:(id)instance {
    //After 90 seconds if the image is not dowanloaded user is informed about that
    if ([spinner isAnimating]) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [spinner stopAnimating];
            [[AppHelper getSharedInstance] showAlertViewOK:self];
        });
    }
}

- (void)notifyToStartDownload {
    [[ArtistFacade getSharedInstance] startImageDownload:[self.songDetail imageUrl]];
}

- (void)yesPressesd {
    [super yesPressesd];
    [[ArtistFacade getSharedInstance] startImageDownload:[self.songDetail imageUrl]];
}

- (void)generateImageName {
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
       imageName = [[ArtistFacade getSharedInstance] generateFileNameFromURL:[self.songDetail imageUrl]];
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[self.songDetail getDataArray] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row != (NSUInteger)3) {
        SongDetailTextCell *cell = [tableView dequeueReusableCellWithIdentifier:SONG_DETAIL_CELL forIndexPath:indexPath];
        if (cell == nil)
        {
            cell = [[SongDetailTextCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:SONG_DETAIL_CELL];
        }
        cell.songLbl.text = [self.songDetail getCellTitle:indexPath.row];
        cell.songDetailLbl.text = [self.songDetail getDataArray][indexPath.row];
        
        return cell;
    } else {
        SongDetailImageCell *cell = [tableView dequeueReusableCellWithIdentifier:ALBUM_IMAGE_CELL forIndexPath:indexPath];
        if (cell == nil)
        {
            cell = [[SongDetailImageCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ALBUM_IMAGE_CELL];
        }
        cell.songLbl.text = [self.songDetail getCellTitle:indexPath.row];
        
        id<PLazyLoadUIImageView> imgView = cell.songImageView;
        if ([imgView lazyLoadDelegate] == nil) {
            [imgView setLazyLoadDelegate:self];
        }
        [imgView setImage:savedImg];
        
        return cell;
    }
}

- (void)downloadDidFinish:(NSURL*)filePath {
    if (filePath == nil) {
        [self showAlertView];
        return;
    }
    CFTimeInterval startTime = CACurrentMediaTime();
    CFTimeInterval elapsedTime = 0;
    while (imageName == nil && elapsedTime < 20) {
        [NSThread sleepForTimeInterval:0.1];
        elapsedTime = CACurrentMediaTime() - startTime;
    }
    if ([imageName isEqualToString:[filePath lastPathComponent]]) {
        self.imageURL = filePath;
        [[ArtistFacade getSharedInstance] getSavedImage:filePath andCompletionHandler:^(UIImage *result) {
            savedImg = result;
            dispatch_async(dispatch_get_main_queue(), ^{
                [spinner stopAnimating];
                [self.tableView reloadData];
            });
        }];
    }
}
//[[ArtistFacade getSharedInstance] generateFileNameFromURL:urlString];
/**- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 71.0;
}**/


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
