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
        downloadInstanceDic = [[NSMutableDictionary alloc] init];
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

- (void)startImageDownload:(NSString*)urlStr withCachingStatus:(BOOL)status {
    id<PImageDownloader> downLoader = [[ImageDownloader alloc] initWithURL:urlStr];
    [downLoader setCashing:status];
    //[downLoader downloadImage:urlStr];
    [downLoader setDelegate:self];
    [downloadInstanceDic setValue:downLoader forKey:urlStr];
}

- (void)downloadDidFinish:(NSURL*)filePath {
    [self.delegate downloadDidFinish:filePath];
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

@end


