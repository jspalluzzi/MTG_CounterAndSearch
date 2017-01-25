//
//  CardTableViewCell.h
//  MTG_CounterAndSearch
//
//  Created by xavier on 1/24/17.
//  Copyright © 2017 John. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CardTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *cardImageView;
@property (weak, nonatomic) IBOutlet UILabel *cardNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *colorsLabel;


@end
