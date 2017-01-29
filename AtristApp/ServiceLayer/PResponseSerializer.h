//
//  PResponseSerializer.h
//  AtristApp
//
//  Created by pqj647 on 1/28/17.
//  Copyright © 2017 pqj647. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PEntiityBuilder.h"

@protocol PResponseSerializer <NSObject>

- (NSArray*)processResponse:(NSData*)data;
- (id<PEntiityBuilder>)generateEntityBuilder;

@end
