//
//  PResponseSerializer.h
//  AtristApp
//
//  Created by pqj647 on 1/28/17.
//  Copyright © 2017 pqj647. All rights reserved.
//

/**
 * Interface for All Response serializers
 */

#import <Foundation/Foundation.h>
#import "PEntiityBuilder.h"

@protocol PResponseSerializer <NSObject>

/**
 * Process response from thhe web service
 * @param data from the web service.
 * @return Generated objects.
 */
- (NSArray*)processResponse:(NSData*)data;

/**
 * Creates an entity builder
 */
- (id<PEntiityBuilder>)generateEntityBuilder;

@end
