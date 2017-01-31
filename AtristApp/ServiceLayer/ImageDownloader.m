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

- (instancetype)initWithURL:(NSString*)urlString withFileName:(NSString*)crntfileName {
    if (self == [super init]) {
        fileName = crntfileName;
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

- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(NSURL *)location {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSURL *destinationURL = [[ArtistFacade getSharedInstance] getDestinationURL:fileName];
    
    NSError *error = nil;
    
    if ([fileManager moveItemAtURL:location toURL:destinationURL error:&error]) {
        [self.delegate downloadDidFinish:destinationURL];
    } else {
        [self.delegate downloadDidFinish:nil];
    }
}

- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didWriteData:(int64_t)bytesWritten totalBytesWritten:(int64_t)totalBytesWritten totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite {
}


- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didResumeAtOffset:(int64_t)fileOffset expectedTotalBytes:(int64_t)expectedTotalBytes {
    
}

//
- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error {
    [self.backgroundSession invalidateAndCancel];
}


@end
