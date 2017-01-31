//
//  AppHelper.h
//  AtristApp
//
//  Created by pqj647 on 1/31/17.
//  Copyright © 2017 pqj647. All rights reserved.
//

/**
 * Utility class for alert views.
 */

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "SuperTableViewController.H"

@interface AppHelper : NSObject
{
    /**
     * UIAlertController instance
     */
    UIAlertController *alert;
}

/**
 * returns singleton instance of the class
 */
+ (AppHelper*)getSharedInstance;

/**
 * show alert view with ok and cancel buttons
 * @param controller calling Viewcontroler
 */
- (void)showAlertViewOKCancel:(SuperTableViewController*)controller;

/**
 * Dismiss the viewcontroller
 */
- (void)dismissAlertView;

/**
 * show alert view with ok button
 * @param controller calling Viewcontroler
 */
- (void)showAlertViewOK:(SuperTableViewController*)controller;

@end
