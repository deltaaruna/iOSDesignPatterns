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

@property(nonatomic, strong) NSString *artist;
@property(nonatomic, strong) NSString *status;
@property(nonatomic, strong) NSString *time;
@property(nonatomic, strong) NSString *album;
@property(nonatomic, strong) NSString *imageUrl;
@property(nonatomic, strong) NSString *duration;
@property(nonatomic, strong) NSString *title;
@property(nonatomic, strong) NSString *type;

@end
