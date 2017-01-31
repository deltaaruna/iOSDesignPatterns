//
//  SongDetailImageCell.h
//  AtristApp
//
//  Created by pqj647 on 1/29/17.
//  Copyright © 2017 pqj647. All rights reserved.
//

/**
 * This class represent the UITableViewCell to desplay song details with the image
 */

#import <UIKit/UIKit.h>
#import "SongNameCellTableViewCell.h"
#import "LazyUIImageView.h"

@interface SongDetailImageCell : SongNameCellTableViewCell

/**
 * UIImage view for the album image
 */
@property (weak, nonatomic) IBOutlet LazyUIImageView *songImageView;

@end
