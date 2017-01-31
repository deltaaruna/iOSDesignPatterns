//
//  SuperTableViewController.h
//  AtristApp
//
//  Created by pqj647 on 1/30/17.
//  Copyright © 2017 pqj647. All rights reserved.
//

/**
 * Super calss for two UITableViews
 */

#import <UIKit/UIKit.h>

@interface SuperTableViewController : UITableViewController<UIAlertViewDelegate>
{
    /**
     * UIActivity indicator
     */
    UIActivityIndicatorView *spinner;
}

/**
 * UIActivity indicator
 */
- (void)yesPressesd;

- (void)showAlertView;

@end
