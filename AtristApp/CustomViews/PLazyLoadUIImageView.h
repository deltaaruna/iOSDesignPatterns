//
//  PLazyLoadUIImageView.h
//  AtristApp
//
//  Created by pqj647 on 1/31/17.
//  Copyright © 2017 pqj647. All rights reserved.
//

/**
 * Interfaces for the lazy loading UIImageView
 */

#import <Foundation/Foundation.h>
@protocol  LazyLoadProtocol;

@protocol PLazyLoadUIImageView <NSObject>

/**
 * Set the delegate
 * @param delegate delagate
 */
- (void)setLazyLoadDelegate:(id<LazyLoadProtocol>)delegate;

/**
 * Get the lazy load daligate
 * @Return delegate
 */
- (id<LazyLoadProtocol>)lazyLoadDelegate;

/**
 * Set image of the UIImageView
 * @param image UIImage
 */
- (void)setImage:(UIImage *)image;

@end
