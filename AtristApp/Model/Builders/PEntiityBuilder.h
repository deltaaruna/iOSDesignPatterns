//
//  PEntiityBuilder.h
//  AtristApp
//
//  Created by pqj647 on 1/29/17.
//  Copyright © 2017 pqj647. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PEntity.h"

@protocol PEntiityBuilder <NSObject>

- (id<PEntity>)getEntity;
- (void)setEntityData:(NSObject*)data;

@end
