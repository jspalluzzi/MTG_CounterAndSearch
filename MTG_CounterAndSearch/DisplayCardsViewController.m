//
//  DisplayCardsViewController.m
//  MTG_CounterAndSearch
//
//  Created by xavier on 1/24/17.
//  Copyright © 2017 John. All rights reserved.
//

#import "DisplayCardsViewController.h"
#import "CardModel.h"
#import "CardTableViewCell.h"
#import "UIImageView+AFNetworking.h"

@interface DisplayCardsViewController ()


@end

@implementation DisplayCardsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//MARK: - UITableView

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _cardsArray.count;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *MyIdentifier = @"CardCell"; //Set Identifier for cell
    
    NSDictionary *cardDict = [_cardsArray objectAtIndex:indexPath.row];
    
    CardTableViewCell *cell = (CardTableViewCell *)[tableView dequeueReusableCellWithIdentifier: MyIdentifier];

    cell.cardNameLabel = cardDict[@"name"];
    cell.colorsLabel = cardDict[@""];
    
    NSString *strImageLink = [NSString stringWithFormat:@"%@",cardDict[@"imageUrl"]];
    __weak CardTableViewCell *weakCell = cell;
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:strImageLink]];
    
    [weakCell.cardImageView setImageWithURLRequest:request
                                  placeholderImage:nil
                                           success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
                                               weakCell.cardImageView.image = image;
                                               [weakCell setNeedsLayout];
                                           } failure:nil];
    
    
    return cell;
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
