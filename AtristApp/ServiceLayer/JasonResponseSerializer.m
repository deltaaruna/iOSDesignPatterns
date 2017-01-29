//
//  JasonResponseSerializer.m
//  AtristApp
//
//  Created by pqj647 on 1/28/17.
//  Copyright © 2017 pqj647. All rights reserved.
//

#import "JasonResponseSerializer.h"
#import "SongDetailsBuilder.h"
#import "PEntiityBuilder.h"
#import "PSongDetails.h"

static NSString *firstElement = @"playoutData";

@implementation JasonResponseSerializer

- (NSArray*)processResponse:(NSData*)data
{
    NSDictionary *resDic = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    NSArray *playoutArray = resDic[firstElement];
    NSMutableArray *dataArray = [[NSMutableArray alloc] init];
    for (NSDictionary *dic in playoutArray) {
        id<PEntiityBuilder> builder = [self generateEntityBuilder];
        [builder setEntityData:dic];
        id<PSongDetails> entity = [builder getEntity];
        [dataArray addObject:entity];
    }
    
    return [dataArray copy];
}

- (id<PEntiityBuilder>)generateEntityBuilder
{
    return [[SongDetailsBuilder alloc] init];
}

@end
