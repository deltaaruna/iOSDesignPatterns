//
//  ImageDownloader.m
//  AtristApp
//
//  Created by pqj647 on 1/30/17.
//  Copyright © 2017 pqj647. All rights reserved.
//

#import "ImageDownloader.h"
#import "ArtistFacade.h"

@interface ImageDownloader()
{
    NSURLSessionDownloadTask *download;
    NSString *fileName;
}

@end

@implementation ImageDownloader

- (instancetype)initWithURL:(NSString*)urlString {
    if (self == [super init]) {
        fileName = [[ArtistFacade getSharedInstance] generateFileNameFromURL:urlString];
        NSURLSessionConfiguration *backgroundConfigurationObject = [NSURLSessionConfiguration backgroundSessionConfigurationWithIdentifier:fileName];
        self.backgroundSession = [NSURLSession sessionWithConfiguration:backgroundConfigurationObject delegate:self delegateQueue:[NSOperationQueue mainQueue]];
        
        if (nil == download) {
            NSURL *url = [NSURL URLWithString:urlString];
            download = [self.backgroundSession downloadTaskWithURL:url];
            [download resume];
        }
    }
    
    return self;
}

- (void)downloadImage:(NSString*)urlString {
    if (nil == download){
        NSURL *url = [NSURL URLWithString:urlString];
        download = [self.backgroundSession downloadTaskWithURL:url];
        fileName = [[ArtistFacade getSharedInstance] generateFileNameFromURL:urlString];
        [download resume];
    }
}

- (void)setCashing:(BOOL)enable {
}

- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(NSURL *)location {
    NSString *cacheDir = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory,NSUserDomainMask,YES)lastObject];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSURL *destinationURL = [NSURL fileURLWithPath:[cacheDir stringByAppendingPathComponent:fileName]];
    
    NSError *error = nil;
    
    if ([fileManager fileExistsAtPath:[destinationURL path]]){
        [fileManager replaceItemAtURL:destinationURL withItemAtURL:destinationURL backupItemName:nil options:NSFileManagerItemReplacementUsingNewMetadataOnly resultingItemURL:nil error:&error];
        [self.delegate downloadDidFinish:destinationURL];
    }else{
        
        if ([fileManager moveItemAtURL:location toURL:destinationURL error:&error]) {
            [self.delegate downloadDidFinish:destinationURL];
        }else{
            [self.delegate downloadDidFinish:nil];
        }
    }
}


- (BOOL)doesFileExist {
    NSString *cacheDir = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory,NSUserDomainMask,YES)lastObject];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSURL *destinationURL = [NSURL fileURLWithPath:[cacheDir stringByAppendingPathComponent:fileName]];
    
    if ([fileManager fileExistsAtPath:[destinationURL path]]) {
        [self.delegate downloadDidFinish:destinationURL];
        return YES;
    } else {
        return NO;
    }
}


- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didWriteData:(int64_t)bytesWritten totalBytesWritten:(int64_t)totalBytesWritten totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite {
}


- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didResumeAtOffset:(int64_t)fileOffset expectedTotalBytes:(int64_t)expectedTotalBytes{
    
}

//
- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error{
    [self.backgroundSession invalidateAndCancel];
}


@end
