//
//  TipViewController.m
//  tipcalculator
//
//  Created by Cooper Mor on 9/18/13.
//  Copyright (c) 2013 bar. All rights reserved.
//

#import "TipViewController.h"

@interface TipViewController ()

@property (retain, nonatomic) IBOutlet UITextField *billTextField;
@property (retain, nonatomic) IBOutlet UILabel *tipLabel;
@property (retain, nonatomic) IBOutlet UILabel *totalLabel;
@property (retain, nonatomic) IBOutlet UISegmentedControl *tipControl;

//instance method with '-' character. (IBAction) return type is basically void 
- (IBAction)onTap:(id)sender;
- (void)updateValues;

@end

@implementation TipViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Tip Calculator";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self updateValues];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_billTextField release];
    [_tipLabel release];
    [_totalLabel release];
    [_tipControl release];
    [super dealloc];
}

//called whenever user taps on the encompassing UIViewController
- (IBAction)onTap:(id)sender {
    [self.view endEditing:YES];
    
    //update all values in case user entered a value into the billLabel
    [self updateValues];
}

- (void)updateValues {
    //extract the bill value user inputted
    float billAmount = [self.billTextField.text floatValue];
    
    NSArray* tipPercents = @[@(0.1), @(0.15), @(0.2)];
    //get the tip user selected from the UISegmentControl named tipControl and determine the total tip and total amount
    int index = self.tipControl.selectedSegmentIndex;
    float tipPercent = [tipPercents[index] floatValue];
    
    
    //need to strip out trailing '%' character in order to get the number and then need to convert it to a float
    //NSString *tipPercentStr = [self.tipControl titleForSegmentAtIndex: index];
    //float tipPercent = [[tipPercentStr substringToIndex:([tipPercentStr length] - 1)] floatValue];
    //tipPercent = tipPercent/100;
    
    float tipAmount = billAmount * tipPercent;
    float totalAmount = billAmount + tipAmount;
    
    //set the labels for tipLabel and totalLabel
    self.tipLabel.text = [NSString stringWithFormat:@"$%0.2f", tipAmount];
    self.totalLabel.text = [NSString stringWithFormat:@"$%0.2f", totalAmount];
}

@end
