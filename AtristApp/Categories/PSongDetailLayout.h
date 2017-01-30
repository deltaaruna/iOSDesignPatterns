//
//  PSongDetailLayout.h
//  AtristApp
//
//  Created by pqj647 on 1/30/17.
//  Copyright © 2017 pqj647. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PSongDetailLayout <NSObject>

- (NSArray*)getDataArray;

- (NSString*)getCellTitle:(NSUInteger)index;

@end
