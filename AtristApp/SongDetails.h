//
//  SongDetails.h
//  Test1
//
//  Created by pqj647 on 1/27/17.
//  Copyright © 2017 pqj647. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PSongDetails.h"

@interface SongDetails : NSObject<PSongDetails>

@property NSString *artist;
@property NSString *status;
@property NSString *time;
@property NSString *album;
@property NSString *imageUrl;
@property NSString *duration;
@property NSString *title;
@property NSString *type;

@end
