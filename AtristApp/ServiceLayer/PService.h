//
//  AppDelegate.h
//  AtristApp
//
//  Created by pqj647 on 1/28/17.
//  Copyright © 2017 pqj647. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PService <NSObject>

- (void)callService:(void(^)(NSArray *resultArray, NSError *error))completionBlock;

@end
