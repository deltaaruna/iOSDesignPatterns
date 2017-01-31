//
//  AppHelper.h
//  AtristApp
//
//  Created by pqj647 on 1/31/17.
//  Copyright © 2017 pqj647. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "SuperTableViewController.H"

@interface AppHelper : NSObject
{
    UIAlertController *alert;
}

+ (AppHelper*)getSharedInstance;

- (void)showAlertViewOKCancel:(SuperTableViewController*)controller;

- (void)dismissAlertView;

- (void)showAlertViewOK:(SuperTableViewController*)controller;

@end
