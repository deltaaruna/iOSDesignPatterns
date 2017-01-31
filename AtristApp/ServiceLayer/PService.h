//
//  AppDelegate.h
//  AtristApp
//
//  Created by pqj647 on 1/28/17.
//  Copyright © 2017 pqj647. All rights reserved.
//

/**
 * Interface for All the services in the system
 */

#import <Foundation/Foundation.h>

@protocol PService <NSObject>

/**
 * Call the service and returns array of results or an error if there is a problem
 */
- (void)callService:(void(^)(NSArray *resultArray, NSError *error))completionBlock;

@end
