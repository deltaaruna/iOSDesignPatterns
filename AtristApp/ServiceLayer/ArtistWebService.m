//
//  ArtistWebService.m
//  AtristApp
//
//  Created by pqj647 on 1/28/17.
//  Copyright © 2017 pqj647. All rights reserved.
//

#import "ArtistWebService.h"
#import "JasonResponseSerializer.h"
#import "config.h"

@implementation ArtistWebService

+ (ArtistWebService*)getSharedInstance {
    static ArtistWebService *sharedInstance = nil;
    static dispatch_once_t token;
    dispatch_once(&token, ^{
        sharedInstance = [[ArtistWebService alloc] initWithBaseURL:[NSURL URLWithString:BASE_URL]];
        sharedInstance.responseSerializer = [[JasonResponseSerializer alloc] init];
    });
    
    return sharedInstance;
}

- (void)callService:(void(^)(NSArray *resultArray, NSError *error))completionBlock
{
    [self getJsonResponse:BASE_URL success:^(NSArray *responseArr) {
        completionBlock(responseArr,nil);
    } failure:^(NSError *error) {
        completionBlock(nil,error);
    }];
}

-(void)getJsonResponse:(NSString *)urlStr success:(void (^)(NSArray *responseArr))success failure:(void(^)(NSError* error))failure
{
    NSURLSession *session = [NSURLSession sharedSession];
    NSURL *url = [NSURL URLWithString:urlStr];
    
    // Asynchronously API is hit here
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:url
                                            completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                if (error)
                                                    failure(error);
                                                else {
                                                    NSArray *responseArray = [self.responseSerializer processResponse:data];
                                                    success(responseArray);
                                                }
                                            }];
    [dataTask resume];    // Executed First
}

@end
