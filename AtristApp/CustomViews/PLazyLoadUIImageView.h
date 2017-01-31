//
//  PLazyLoadUIImageView.h
//  AtristApp
//
//  Created by pqj647 on 1/31/17.
//  Copyright © 2017 pqj647. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol  LazyLoadProtocol;

@protocol PLazyLoadUIImageView <NSObject>

- (void)setLazyLoadDelegate:(id<LazyLoadProtocol>)delegate;

- (id<LazyLoadProtocol>)lazyLoadDelegate;

- (void)setImage:(UIImage *)image;

@end
