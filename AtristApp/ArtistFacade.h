//
//  ArtistFacade.h
//  AtristApp
//
//  Created by pqj647 on 1/28/17.
//  Copyright © 2017 pqj647. All rights reserved.
//

/*****
 Facade class for the app
 ******/

#import <Foundation/Foundation.h>
#import "PImageDownloader.h"
#import <UIKit/UIKit.h>
#import "ImageDownloader.h"

@protocol DownLoadStateNotifyAdapterFacade;
@protocol DownLoadStateNotifyAdapter;

@interface ArtistFacade : NSObject<DownLoadStateNotifyAdapter>
{
    NSMutableArray *downloadStateDelegates;
}

@property (nonatomic, weak)id<DownLoadStateNotifyAdapterFacade> delegate;

- (instancetype)init;

/**
 * THis is the singleton initalizer.
 * @return Singeton object.
 */
+ (ArtistFacade*)getSharedInstance;

/**
 * This calls the artist web service.
 * completionBlock array of result object via a block
 */
- (void)callArtistService:(void(^)(NSArray *resultArray, NSError *error))completionBlock;

/**
 * This method is used to downlaod images.
 * @param urlStr string url of the image.
 */
- (void)startImageDownload:(NSString*)urlStr;

/**
 * Used to get saved images.
 * @param imageURL - url of the image
 * completionHandler saved image via the block.
 */
- (void)getSavedImage:(NSURL*)imageURL  andCompletionHandler:(void (^)(UIImage* result))completionHandler;

/**
 * Create file name for the image
 * @param url - url of the image.
 * @return Generate image name.
 */
- (NSString*)generateFileNameFromURL:(NSString*)url;

/**
 * Get the path that the image is going to be saved
 * @param fileName - filename .
 * @return Generate image name.
 */
- (NSURL*)getDestinationURL:(NSString*)fileName;

/**
 * Add delegate to the list
 * @param delegate to be added
 */
- (void)addDownloadDelegate:(id<DownLoadStateNotifyAdapterFacade>)delegate;

/**
 * Remove delegate from the list
 * @param delegate to be removed
 */
- (void)removeDownloadDelegate:(id<DownLoadStateNotifyAdapterFacade>)delegate;

@end

@protocol DownLoadStateNotifyAdapterFacade <NSObject>

/**
 * Notify when download is finished
 */
- (void)downloadDidFinish:(NSURL*)filePath;

@end
