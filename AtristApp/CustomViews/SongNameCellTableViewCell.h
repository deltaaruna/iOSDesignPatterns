//
//  SongNameCellTableViewCell.h
//  AtristApp
//
//  Created by pqj647 on 1/29/17.
//  Copyright © 2017 pqj647. All rights reserved.
//

/**
 * This class represent the UITableViewCell to desplay song names
 */

#import <UIKit/UIKit.h>

@interface SongNameCellTableViewCell : UITableViewCell

/**
 * lebel for the name of the song
 */
@property (weak, nonatomic) IBOutlet UILabel *songLbl;


@end
