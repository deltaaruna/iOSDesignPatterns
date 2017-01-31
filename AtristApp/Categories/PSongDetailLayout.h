//
//  PSongDetailLayout.h
//  AtristApp
//
//  Created by pqj647 on 1/30/17.
//  Copyright © 2017 pqj647. All rights reserved.
//

/**
 * Interface for the song detail table representation
 */

#import <Foundation/Foundation.h>

@protocol PSongDetailLayout <NSObject>

/**
 * Get array for the table
 * @Return Array for the table
 */
- (NSArray*)getDataArray;

/**
 * Get title for the of the raw based on the ndex
 * @Return String title
 */
- (NSString*)getCellTitle:(NSUInteger)index;

@end
