//
//  PImageDownloader.h
//  AtristApp
//
//  Created by pqj647 on 1/30/17.
//  Copyright © 2017 pqj647. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol DownLoadStateNotifyAdapter;

@protocol PImageDownloader <NSObject>

- (void)downloadImage:(NSString*)urlString;
- (void)setCashing:(BOOL)enable;
- (void)setDelegate:(id<DownLoadStateNotifyAdapter>)delegate;

@end
