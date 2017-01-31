//
//  SongDetails.h
//  Test1
//
//  Created by pqj647 on 1/27/17.
//  Copyright © 2017 pqj647. All rights reserved.
//

/**
 * Song details class
 */

#import <Foundation/Foundation.h>
#import "PSongDetails.h"

@interface SongDetails : NSObject<PSongDetails>

/**
 * Artist name
 */
@property(nonatomic, strong) NSString *artist;

/**
 * status
 */
@property(nonatomic, strong) NSString *status;

/**
 * time
 */
@property(nonatomic, strong) NSString *time;

/**
 * ALbum name
 */
@property(nonatomic, strong) NSString *album;

/**
 * URL of the album image
 */
@property(nonatomic, strong) NSString *imageUrl;

/**
 * Duration of the song
 */
@property(nonatomic, strong) NSString *duration;

/**
 * Song title
 */
@property(nonatomic, strong) NSString *title;

/**
 * type
 */
@property(nonatomic, strong) NSString *type;

@end
