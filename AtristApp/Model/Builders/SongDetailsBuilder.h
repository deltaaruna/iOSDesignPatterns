//
//  SongDetailsBuilder.h
//  AtristApp
//
//  Created by pqj647 on 1/29/17.
//  Copyright © 2017 pqj647. All rights reserved.
//

/**
 * Class that build SongDetails objects
 */

#import <Foundation/Foundation.h>
#import "PSongEntityBuilder.h"
#import "PSongDetails.h"

@interface SongDetailsBuilder : NSObject<PSongEntityBuilder>
{

    /**
     * Song object to be built
     */
    id<PSongDetails> songObj;
    
    /**
     * Dictionary with jason data
     */
    NSDictionary *resultDic;
}

- (instancetype)init;

@end
