//
//  AbstractWebService.h
//  AtristApp
//
//  Created by pqj647 on 1/28/17.
//  Copyright © 2017 pqj647. All rights reserved.
//

/**
 * Abstract class for services
 *
 */

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
 * Block gives the result array
 */
- (void)callService:(void(^)(NSArray *resultArray, NSError *error))completionBlock;

/**
 * Base url
 */
@property NSURL *baseURL;

/**
 * ResponseSerializer instance
 */
@property id<PResponseSerializer> responseSerializer;

@end
