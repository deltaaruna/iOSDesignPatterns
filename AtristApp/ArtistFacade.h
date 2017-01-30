//
//  ArtistFacade.h
//  AtristApp
//
//  Created by pqj647 on 1/28/17.
//  Copyright © 2017 pqj647. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PImageDownloader.h"
#import <UIKit/UIKit.h>

@protocol DownLoadStateNotifyAdapterFacade;
@protocol DownLoadStateNotifyAdapter;

@interface ArtistFacade : NSObject<DownLoadStateNotifyAdapter>
{
    NSMutableDictionary *downloadInstanceDic;
}

@property (nonatomic, weak)id<DownLoadStateNotifyAdapterFacade> delegate;
- (instancetype)init;
+ (ArtistFacade*)getSharedInstance;
- (void)callArtistService:(void(^)(NSArray *resultArray, NSError *error))completionBlock;
- (void)startImageDownload:(NSString*)urlStr withCachingStatus:(BOOL)status;
- (void)getSavedImage:(NSURL*)imageURL  andCompletionHandler:(void (^)(UIImage* result))completionHandler;
- (NSString*)generateFileNameFromURL:(NSString*)url;

@end

@protocol DownLoadStateNotifyAdapterFacade <NSObject>

- (void)downloadDidFinish:(NSURL*)filePath;

@end
