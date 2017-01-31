//
//  NSArray+SongsTableRepresentation.m
//  AtristApp
//
//  Created by pqj647 on 1/29/17.
//  Copyright © 2017 pqj647. All rights reserved.
//

#import "NSArray+SongsTableRepresentation.h"
#import "SongDetails.h"

@implementation NSArray (SongsTableRepresentation)

- (NSString*)getSongName:(NSUInteger)index {
    NSObject *obj = [self objectAtIndex:index];
    if ([obj isKindOfClass:[SongDetails class]]) {
        SongDetails *songDt = (SongDetails*)obj;
        
        return songDt.title;
    }
    
    return nil;
}

@end
