//
//  ArtistFacade.m
//  AtristApp
//
//  Created by pqj647 on 1/28/17.
//  Copyright © 2017 pqj647. All rights reserved.
//

#import "ArtistFacade.h"
#import "ArtistWebService.h"
#import "ImageDownloader.h"

@implementation ArtistFacade

- (instancetype)init {
    if (self == [super init]) {
        downloadStateDelegates = [[NSMutableArray alloc] init];
    }
    
    return self;
}

+ (ArtistFacade*)getSharedInstance {
    static ArtistFacade *sharedInstance = nil;
    static dispatch_once_t token;
    dispatch_once(&token, ^{
        sharedInstance = [[ArtistFacade alloc] init];
    });
    
    return sharedInstance;
}

- (void)callArtistService:(void(^)(NSArray *resultArray, NSError *error))completionBlock {
    ArtistWebService *webService = [ArtistWebService getSharedInstance];
    [webService callService:^(NSArray *resultArray, NSError *error) {
        completionBlock(resultArray, error);
    }];
}

- (void)startImageDownload:(NSString*)urlStr {
    NSString *fileName = [self generateFileNameFromURL:urlStr];
    if ([self doesFileExist:fileName]) {
        [self downloadDidFinish:[self getDestinationURL:fileName]];
    } else {
        id<PImageDownloader> downLoader = [[ImageDownloader alloc] initWithURL:urlStr withFileName:[self generateFileNameFromURL:urlStr]];
        [downLoader setDelegate:self];
    }
}

- (BOOL)doesFileExist:(NSString*)fileName {
    NSURL *destinationURL = [self getDestinationURL:fileName];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:[destinationURL path]]) {
        return YES;
    } else {
        return NO;
    }
}

- (NSURL*)getDestinationURL:(NSString*)fileName {
    NSString *cacheDir = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory,NSUserDomainMask,YES)lastObject];
    return  [NSURL fileURLWithPath:[cacheDir stringByAppendingPathComponent:fileName]];
}

- (void)downloadDidFinish:(NSURL*)filePath {
    for (id<DownLoadStateNotifyAdapterFacade> delegate in [downloadStateDelegates copy])
    {
        if (delegate != nil && [delegate respondsToSelector:@selector(downloadDidFinish:)])
        {
            dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                [delegate downloadDidFinish:filePath];
            });
        }
    }
}

- (void)getSavedImage:(NSURL*)imageURL  andCompletionHandler:(void (^)(UIImage* result))completionHandler {
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        UIImage *img  = [UIImage imageWithData:[NSData dataWithContentsOfURL:imageURL]];
        completionHandler(img);
    });
}

- (NSString*)generateFileNameFromURL:(NSString*)url {
    NSString *lastFileName = [url lastPathComponent];
    NSString *noFileURL = [url stringByDeletingLastPathComponent];
    NSString *noShaslURL = [[noFileURL stringByReplacingOccurrencesOfString:@"/" withString:@"_"] stringByReplacingOccurrencesOfString:@"/" withString:@""];
    return  [[noShaslURL stringByReplacingOccurrencesOfString:@"." withString:@""] stringByAppendingString:lastFileName];
}

- (void)addDownloadDelegate:(id<DownLoadStateNotifyAdapterFacade>)delegate {
    [downloadStateDelegates addObject:delegate];
}

- (void)removeDownloadDelegate:(id<DownLoadStateNotifyAdapterFacade>)delegate {
    [downloadStateDelegates removeObject:delegate];
}

@end


