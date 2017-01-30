//
//  SongDetailsBuilder.h
//  AtristApp
//
//  Created by pqj647 on 1/29/17.
//  Copyright © 2017 pqj647. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PSongEntityBuilder.h"
#import "PSongDetails.h"

@interface SongDetailsBuilder : NSObject<PSongEntityBuilder>
{

    id<PSongDetails> songObj;
    NSDictionary *resultDic;
}

- (instancetype)init;

@end
