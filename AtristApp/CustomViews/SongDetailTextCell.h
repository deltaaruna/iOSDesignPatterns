//
//  SongDetailTextCell.h
//  AtristApp
//
//  Created by pqj647 on 1/29/17.
//  Copyright © 2017 pqj647. All rights reserved.
//

/**
 * This class represent the UITableViewCell to desplay song details
 */

#import <UIKit/UIKit.h>
#import "SongNameCellTableViewCell.h"

@interface SongDetailTextCell : SongNameCellTableViewCell

/**
 * lebel for the details of the song(duration/album etc)
 */
@property (weak, nonatomic) IBOutlet UILabel *songDetailLbl;

@end
