//
//  PSongEntityBuilder.h
//  AtristApp
//
//  Created by pqj647 on 1/31/17.
//  Copyright © 2017 pqj647. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PEntiityBuilder.h"
#import "PSongDetails.h"

@protocol PSongEntityBuilder <PEntiityBuilder>

- (id<PSongDetails>)getEntity;

@end
