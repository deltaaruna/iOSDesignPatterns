//
//  SongDetailsBuilder.m
//  AtristApp
//
//  Created by pqj647 on 1/29/17.
//  Copyright © 2017 pqj647. All rights reserved.
//

#import "SongDetailsBuilder.h"
#import "SongDetails.h"
#import "PSongDetails.h"

static NSString *album = @"album";
static NSString *artist = @"artist";
static NSString *duration = @"duration";
static NSString *imageUrl = @"imageUrl";
static NSString *status = @"status";
static NSString *timeconst = @"time";
static NSString *title = @"title";
static NSString *type = @"type";

@implementation SongDetailsBuilder

- (instancetype)init
{
    if (self == [super init]) {
        songObj = [[SongDetails alloc] init];
    }
    
    return self;
}

- (id<PSongDetails>)getEntity
{
    return songObj;
}
- (void)setEntityData:(NSDictionary*)data
{
    resultDic = data;
    if ([self isKeyExist:album]) {
        [songObj setAlbum:[data valueForKey:album]];
    }
    if ([self isKeyExist:artist]) {
        [songObj setArtist:[data valueForKey:artist]];
    }
    if ([self isKeyExist:duration]) {
        [songObj setDuration:[data valueForKey:duration]];
    }
    if ([self isKeyExist:imageUrl]) {
        [songObj setImageUrl:[data valueForKey:imageUrl]];
    }
    if ([self isKeyExist:status]) {
        [songObj setStatus:[data valueForKey:status]];
    }
    if ([self isKeyExist:timeconst]) {
        [songObj setTime:[data valueForKey:timeconst]];
    }
    if ([self isKeyExist:title]) {
        [songObj setTitle:[data valueForKey:title]];
    }
    if ([self isKeyExist:type]) {
        [songObj setType:[data valueForKey:type]];
    }
}

- (BOOL)isKeyExist:(NSString*)key
{
    if([resultDic valueForKey:key] != nil) {
        // The key existed...
        return YES;
    }
    else {
        // No joy...
        return NO;
    }
}

@end
