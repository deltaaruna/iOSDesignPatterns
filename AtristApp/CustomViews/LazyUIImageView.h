//
//  LazyUIImageView.h
//  AtristApp
//
//  Created by pqj647 on 1/31/17.
//  Copyright © 2017 pqj647. All rights reserved.
//

/**
 * This class UIImageView subclass for lazy loading proxy pattern
 */

#import <UIKit/UIKit.h>
#import "PLazyLoadUIImageView.h"

@protocol  LazyLoadProtocol;

@interface LazyUIImageView : UIImageView<PLazyLoadUIImageView>

/**
 * lazy loading protocol
 */
@property(nonatomic, weak) id<LazyLoadProtocol> lazyLoadDelegate;

@end

@protocol  LazyLoadProtocol <NSObject>

- (void)notifyToStartDownload;

@end
