//
//  PSongDetails.h
//  AtristApp
//
//  Created by pqj647 on 1/28/17.
//  Copyright © 2017 pqj647. All rights reserved.
//

/**
 * Interface for SongDetails entity in the project
 */

#import <Foundation/Foundation.h>
#import "PEntity.h"

@protocol PSongDetails <PEntity>

/****
 Following are Getters and setters for all the fields in the entity
 ***/

- (NSString*)album;
- (void)setAlbum:(NSString*)album;

- (NSString*)artist;
- (void)setArtist:(NSString*)artist;

- (NSString*)duration;
- (void)setDuration:(NSString*)duration;

- (NSString*)imageUrl;
- (void)setImageUrl:(NSString*)imageUrl;

- (NSString*)status;
- (void)setStatus:(NSString*)status;

- (NSString*)time;
- (void)setTime:(NSString*)time;

- (NSString*)title;
- (void)setTitle:(NSString*)title;

- (NSString*)type;
- (void)setType:(NSString*)title;

@end
