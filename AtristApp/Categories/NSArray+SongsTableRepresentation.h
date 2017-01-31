//
//  NSArray+SongsTableRepresentation.h
//  AtristApp
//
//  Created by pqj647 on 1/29/17.
//  Copyright © 2017 pqj647. All rights reserved.
//

/**
 * This category is used to desplay song names
 */

#import <Foundation/Foundation.h>


@interface NSArray (SongsTableRepresentation)

/**
 * Provide song name for the array index
 * @ Param index index of the song
 * @ Return song name
 */
- (NSString*)getSongName:(NSUInteger)index;

@end
