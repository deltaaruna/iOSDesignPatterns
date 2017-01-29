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

- (instancetype)initWithBaseURL:(NSURL*)url;
- (void)callService:(void(^)(NSArray *resultArray, NSError *error))completionBlock;

@property NSURL *baseURL;
@property id<PResponseSerializer> responseSerializer;

@end
