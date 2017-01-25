//
//  LifeCounterViewController.m
//  MTG_CounterAndSearch
//
//  Created by xavier on 1/24/17.
//  Copyright © 2017 John. All rights reserved.
//

#import "LifeCounterViewController.h"

@interface LifeCounterViewController ()

@end

@implementation LifeCounterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)didSelectSearchCards:(id)sender {
    
    [self performSegueWithIdentifier:@"CounterToSearch" sender:nil];
    
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
