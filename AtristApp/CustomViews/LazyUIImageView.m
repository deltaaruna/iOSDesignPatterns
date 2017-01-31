//
//  LazyUIImageView.m
//  AtristApp
//
//  Created by pqj647 on 1/31/17.
//  Copyright © 2017 pqj647. All rights reserved.
//

#import "LazyUIImageView.h"

@implementation LazyUIImageView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)setImage:(UIImage *)image {
    [super setImage:image];
    if (image == nil) {
        self.backgroundColor = [UIColor grayColor];
        if (self.lazyLoadDelegate != nil && [self.lazyLoadDelegate respondsToSelector:@selector(notifyToStartDownload)]) {
            [self.lazyLoadDelegate notifyToStartDownload];
        }
    }
}

@end
