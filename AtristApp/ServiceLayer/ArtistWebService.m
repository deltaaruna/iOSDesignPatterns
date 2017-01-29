//
//  ArtistWebService.m
//  AtristApp
//
//  Created by pqj647 on 1/28/17.
//  Copyright © 2017 pqj647. All rights reserved.
//

#import "ArtistWebService.h"
#import "JasonResponseSerializer.h"

static NSString *baseURL = @"";

@implementation ArtistWebService

+ (ArtistWebService*)getSharedInstance {
    static ArtistWebService *sharedInstance = nil;
    static dispatch_once_t token;
    dispatch_once(&token, ^{
        sharedInstance = [[ArtistWebService alloc] initWithBaseURL:[NSURL URLWithString:baseURL]];
        sharedInstance.responseSerializer = [[JasonResponseSerializer alloc] init];
    });
    
    return sharedInstance;
}

- (void)callService:(void(^)(NSArray *resultArray, NSError *error))completionBlock
{
    [self getJsonResponse:@"https://dl.dropboxusercontent.com/s/u0d2hcnt1xw7l90/testdata.json" success:^(NSArray *responseArr) {
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
                                                NSLog(@"%@",data);
                                                if (error)
                                                    failure(error);
                                                else {
                                                    //NSDictionary *json  = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                                                    //NSLog(@"%@",json);
                                                    NSArray *responseArray = [self.responseSerializer processResponse:data];
                                                    success(responseArray);
                                                }
                                            }];
    [dataTask resume];    // Executed First
}

@end
