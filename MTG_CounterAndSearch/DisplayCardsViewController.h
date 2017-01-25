//
//  DisplayCardsViewController.h
//  MTG_CounterAndSearch
//
//  Created by xavier on 1/24/17.
//  Copyright © 2017 John. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CardModel.h"
#import "CardTableViewCell.h"
#import "UIImageView+AFNetworking.h"

#import "CardViewController.h"

@interface DisplayCardsViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property NSArray *cardsArray;

@end
