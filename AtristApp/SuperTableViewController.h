//
//  SuperTableViewController.h
//  AtristApp
//
//  Created by pqj647 on 1/30/17.
//  Copyright © 2017 pqj647. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SuperTableViewController : UITableViewController<UIAlertViewDelegate>
{
    UIActivityIndicatorView *spinner;
}

- (void)yesPressesd;

- (void)showAlertView;

@end
