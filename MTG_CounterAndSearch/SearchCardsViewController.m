//
//  SearchCardsViewController.m
//  MTG_CounterAndSearch
//
//  Created by xavier on 1/24/17.
//  Copyright © 2017 John. All rights reserved.
//

#import "SearchCardsViewController.h"

@interface SearchCardsViewController ()
@property (weak, nonatomic) IBOutlet MultiSelectSegmentedControl *myMultiSeg;
@property (weak, nonatomic) IBOutlet UITextField *cardNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *costTextField;

@property NSArray *allCardsArray;

@end

@implementation SearchCardsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _myMultiSeg.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//MARK: - MultiSelectSegmentedControl

-(void)multiSelect:(MultiSelectSegmentedControl *)multiSelectSegmentedControl didChangeValue:(BOOL)selected atIndex:(NSUInteger)index {
    
    if (selected) {
        NSLog(@"multiSelect with tag %i selected button at index: %i", multiSelectSegmentedControl.tag, index);
    } else {
        NSLog(@"multiSelect with tag %i deselected button at index: %i", multiSelectSegmentedControl.tag, index);
    }
    
    
    NSLog(@"selected: '%@'", [multiSelectSegmentedControl.selectedSegmentTitles componentsJoinedByString:@","]);
    
}


- (IBAction)didSelectSearchBtn:(id)sender {
    
    //verify the information
    //Display activity indicator
    //Send it to the API calling class
    //Remove activity indicator
    //Send information to DisplayCardsVC (info should be CardModels)
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSDictionary *params = @{@"name": @"reality smasher"};
    
    [manager GET:@"https://api.magicthegathering.io/v1/cards" parameters:params progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        if ([responseObject isKindOfClass:[NSArray class]]) {
            NSArray *responseArray = responseObject;
            
            NSLog(@"NSArray: %@", responseArray);
            
        } else if ([responseObject isKindOfClass:[NSDictionary class]]) {
            
            NSDictionary *responseDict = responseObject;
            self.allCardsArray = responseDict[@"cards"];
            
            [self performSegueWithIdentifier:@"SearchToCards" sender:nil];
            
        }
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    
    
    
    
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    DisplayCardsViewController *displayCardsVC = (DisplayCardsViewController*)[segue destinationViewController];
    displayCardsVC.cardsArray = self.allCardsArray;
    
}


@end
