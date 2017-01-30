//
//  AbstractWebService.h
//  AtristApp
//
//  Created by pqj647 on 1/28/17.
//  Copyright © 2017 pqj647. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PResponseSerializer.h"

@interface AbstractWebService : NSObject

/**
 * Main initalizer
 * @param url - base url
 */
- (instancetype)initWithBaseURL:(NSURL*)url;

/**
 * Use to invoke the web service
 * @-return array of resut objects via a block.
 */
- (void)callService:(void(^)(NSArray *resultArray, NSError *error))completionBlock;

@property NSURL *baseURL;
@property id<PResponseSerializer> responseSerializer;

@end
