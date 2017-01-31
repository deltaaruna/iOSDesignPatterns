//
//  PEntiityBuilder.h
//  AtristApp
//
//  Created by pqj647 on 1/29/17.
//  Copyright © 2017 pqj647. All rights reserved.
//

/**
 * Interface for the entity builder
 */

#import <Foundation/Foundation.h>
#import "PEntity.h"

@protocol PEntiityBuilder <NSObject>


/**
 * Get generated entity
 */
- (id<PEntity>)getEntity;

/**
 * Set data for the entity
 * @-param - data - data to populate the entity
 */
- (void)setEntityData:(NSObject*)data;

@end
