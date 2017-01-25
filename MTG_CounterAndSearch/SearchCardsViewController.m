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

@property NSString *titlesToParams;

@end

@implementation SearchCardsViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.titlesToParams = @"";
    
    _myMultiSeg.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//MARK: - UITestFeilds

- (void)textFieldDidEndEditing:(UITextField *)textField {
    
    
    
}

//MARK: - MultiSelectSegmentedControl

-(void)multiSelect:(MultiSelectSegmentedControl *)multiSelectSegmentedControl didChangeValue:(BOOL)selected atIndex:(NSUInteger)index {
    
    if (selected) {
        NSLog(@"multiSelect with tag %i selected button at index: %i", multiSelectSegmentedControl.tag, index);
    } else {
        NSLog(@"multiSelect with tag %i deselected button at index: %i", multiSelectSegmentedControl.tag, index);
    }
    
    
    NSLog(@"selected: '%@'", [multiSelectSegmentedControl.selectedSegmentTitles componentsJoinedByString:@","]);
    
    self.titlesToParams = [[multiSelectSegmentedControl.selectedSegmentTitles componentsJoinedByString:@"|"] lowercaseString];
}



//MARK: - IBActions

- (IBAction)didSelectSearchBtn:(id)sender {
    
    //verify the information
    if(!self.cardNameTextField.hasText){
        return;
    }
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params addEntriesFromDictionary:@{@"name": self.cardNameTextField.text}];
    
    if(self.costTextField.hasText){
        [params addEntriesFromDictionary:@{@"cmc":self.costTextField.text}];
    }
    
    if(![self.titlesToParams isEqual: @""]){
        [params addEntriesFromDictionary:@{@"colors":self.titlesToParams}];
    }
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager GET:@"https://api.magicthegathering.io/v1/cards" parameters:params progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        NSLog(@"TASK: %@", task);
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


//MARK: - UIGestures
- (IBAction)didTapView:(id)sender {
    
    [self setEditing: false];
    
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
