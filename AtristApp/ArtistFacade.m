//
//  ArtistFacade.m
//  AtristApp
//
//  Created by pqj647 on 1/28/17.
//  Copyright © 2017 pqj647. All rights reserved.
//

#import "ArtistFacade.h"
#import "ArtistWebService.h"

@implementation ArtistFacade

+ (ArtistFacade*)getSharedInstance
{
    static ArtistFacade *sharedInstance = nil;
    static dispatch_once_t token;
    dispatch_once(&token, ^{
        sharedInstance = [[ArtistFacade alloc] init];
    });
    
    return sharedInstance;
}

- (void)callArtistService:(void(^)(NSArray *resultArray, NSError *error))completionBlock
{
    ArtistWebService *webService = [ArtistWebService getSharedInstance];
    [webService callService:^(NSArray *resultArray, NSError *error) {
        completionBlock(resultArray, error);
    }];
}

@end

