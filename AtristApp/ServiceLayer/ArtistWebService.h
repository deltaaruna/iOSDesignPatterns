//
//  ArtistWebService.h
//  AtristApp
//
//  Created by pqj647 on 1/28/17.
//  Copyright © 2017 pqj647. All rights reserved.
//

/**
 * Class to retrieve details of this exercise
 */

#import <Foundation/Foundation.h>
#import "PService.h"
#import "AbstractWebService.h"

@interface ArtistWebService : AbstractWebService

/**
 * Get singleton class for the class.
 * @Return singleton object
 */
+ (ArtistWebService*)getSharedInstance;

@end
