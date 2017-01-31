//
//  ImageDownloader.h
//  AtristApp
//
//  Created by pqj647 on 1/30/17.
//  Copyright © 2017 pqj647. All rights reserved.
//

/**
 * This class is used to download images asynchronously
 */

#import <Foundation/Foundation.h>
#import "PImageDownloader.h"
@protocol DownLoadStateNotifyAdapter;

@interface ImageDownloader : NSObject<PImageDownloader, NSURLSessionDownloadDelegate>

/**
 * Back ground session object
 */
@property (nonatomic, strong)NSURLSession *backgroundSession;

/**
 * delegate to notify when download is over
 */
@property (nonatomic, weak)id<DownLoadStateNotifyAdapter> delegate;

- (instancetype)initWithURL:(NSString*)urlString withFileName:(NSString*)crntfileName;

@end

@protocol DownLoadStateNotifyAdapter <NSObject>

- (void)downloadDidFinish:(NSURL*)filePath;

@end
