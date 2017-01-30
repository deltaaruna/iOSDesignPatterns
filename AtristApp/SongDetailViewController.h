//
//  SongDetailViewController.h
//  AtristApp
//
//  Created by pqj647 on 1/29/17.
//  Copyright © 2017 pqj647. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PSongDetails.h"
#import "PSongDetailLayout.h"
#import "PImageDownloader.h"
#import "ArtistFacade.h"
#import "SuperTableViewController.h"

@interface SongDetailViewController : SuperTableViewController<DownLoadStateNotifyAdapterFacade>
{
    UIImage *savedImg;
    NSString *imageName;
}

@property id<PSongDetails, PSongDetailLayout> songDetail;
@property (nonatomic, retain) NSURL *imageURL;

@end
