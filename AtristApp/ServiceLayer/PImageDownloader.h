//
//  PImageDownloader.h
//  AtristApp
//
//  Created by pqj647 on 1/30/17.
//  Copyright © 2017 pqj647. All rights reserved.
//

/**
 * Interface for Image Downloader
 */

#import <Foundation/Foundation.h>
@protocol DownLoadStateNotifyAdapter;

@protocol PImageDownloader <NSObject>

/**
 * Download images
 * @param urlString string of th url
 */
- (void)downloadImage:(NSString*)urlString;

/**
 * Set delegate
 * @param delegate delegate to be set
 */
- (void)setDelegate:(id<DownLoadStateNotifyAdapter>)delegate;

@end
