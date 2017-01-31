//
//  AppHelper.m
//  AtristApp
//
//  Created by pqj647 on 1/31/17.
//  Copyright © 2017 pqj647. All rights reserved.
//

#import "AppHelper.h"
#import "SuperTableViewController.h"
#import "config.h"

@implementation AppHelper

+ (AppHelper*)getSharedInstance {
    static AppHelper *sharedInstance = nil;
    static dispatch_once_t token;
    dispatch_once(&token, ^{
        sharedInstance = [[AppHelper alloc] init];
    });
    
    return sharedInstance;
}

- (void)showAlertViewOKCancel:(SuperTableViewController*)controller {
    AppHelper * __weak weakSelf = self;
    dispatch_async(dispatch_get_main_queue(), ^{
        alert =   [UIAlertController
                                       alertControllerWithTitle:ALERT_TITlE
                                       message:ALERT_MESSAGE
                                       preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *ok = [self getAlertAction:@"OK" withhandler:^(UIAlertAction *action) {
            [controller yesPressesd];
        }];
        UIAlertAction *cancel = [self getAlertAction:@"NO" withhandler:^(UIAlertAction *action) {
            [weakSelf dismissAlertView];
        }];
        
        [alert addAction:ok];
        [alert addAction:cancel];
        
        [controller presentViewController:alert animated:YES completion:nil];
    });
}

- (void)showAlertViewOK:(SuperTableViewController*)controller {
    AppHelper * __weak weakSelf = self;
    dispatch_async(dispatch_get_main_queue(), ^{
        alert =   [UIAlertController
                   alertControllerWithTitle:ALERT_TITlE
                   message:REACHABILITY_MSG
                   preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *ok = [self getAlertAction:@"OK" withhandler:^(UIAlertAction *action) {
            [weakSelf dismissAlertView];
        }];
        
        [alert addAction:ok];
        
        [controller presentViewController:alert animated:YES completion:nil];
    });
}

- (void)dismissAlertView {
    [alert dismissViewControllerAnimated:YES completion:nil];
}

- (UIAlertAction*)getAlertAction:(NSString*)btnTitle withhandler:(void (^ __nullable)(UIAlertAction *action))handler {
    return [UIAlertAction actionWithTitle:btnTitle style:UIAlertActionStyleDefault handler:handler];
}

@end
