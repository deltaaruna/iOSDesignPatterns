//
//  SongDetailViewController.h
//  AtristApp
//
//  Created by pqj647 on 1/29/17.
//  Copyright © 2017 pqj647. All rights reserved.
//

/*****
 This is the view controller that shows more details
 ******/

#import <UIKit/UIKit.h>
#import "PSongDetails.h"
#import "PSongDetailLayout.h"
#import "PImageDownloader.h"
#import "ArtistFacade.h"
#import "SuperTableViewController.h"
#import "LazyUIImageView.h"


@interface SongDetailViewController : SuperTableViewController<DownLoadStateNotifyAdapterFacade, LazyLoadProtocol>
{
    /**
     * Downloaded image
     *
     */
    UIImage *savedImg;
    
    /**
     * Name of the image
     *
     */
    NSString *imageName;
}

/**
 * SongDetails entity
 */
@property id<PSongDetails, PSongDetailLayout> songDetail;

/**
 * Image URL
 */
@property (nonatomic, strong) NSURL *imageURL;

@end
