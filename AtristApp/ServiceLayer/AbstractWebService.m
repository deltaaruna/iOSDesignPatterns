//
//  AbstractWebService.m
//  AtristApp
//
//  Created by pqj647 on 1/28/17.
//  Copyright © 2017 pqj647. All rights reserved.
//

#import "AbstractWebService.h"

@implementation AbstractWebService

- (instancetype)initWithBaseURL:(NSURL*)url
{
    if (self == [super init]) {
        self.baseURL = url;
    }
    
    return self;
}

@end
