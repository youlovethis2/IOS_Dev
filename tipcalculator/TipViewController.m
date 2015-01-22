//
//  TipViewController.m
//  tipcalculator
//
//  Created by Shangqing Zhang on 1/21/15.
//  Copyright (c) 2015 Shangqing Zhang. All rights reserved.
//

#import "TipViewController.h"
#import "SettingsViewController.h"

@interface TipViewController ()

@property (weak, nonatomic) IBOutlet UITextField *billTextField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UILabel *UserSetRate;

- (IBAction)click:(id)sender;
- (void) updateValues;
- (void) firstValues;
- (void) onSettingsButton;
- (IBAction)changeTipDate:(id)sender;


@end

@implementation TipViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Tip Calculator";
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Settings" style:UIBarButtonItemStylePlain target:self action:@selector(onSettingsButton)];

    [super viewDidLoad];
    [self firstValues];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"view will appear ");
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    int intValue = [defaults integerForKey:@"aa"];
    
    self.UserSetRate.text = [NSString stringWithFormat:@"%d",intValue];
    [self firstValues];
}

- (void)viewDidAppear:(BOOL)animated {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    int intValue = [defaults integerForKey:@"aa"];
    self.UserSetRate.text = [NSString stringWithFormat:@"%d",intValue];
}

- (void)viewWillDisappear:(BOOL)animated {
    NSLog(@"view will disappear");
}

- (void)viewDidDisappear:(BOOL)animated {
    NSLog(@"view did disappear");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)click:(id)sender {
    [self.view endEditing:YES];
    [self updateValues];
}

- (void) firstValues {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    float billAmount = [self.billTextField.text floatValue];
    int tipRate = [defaults integerForKey:@"aa"];
    float tipAmount = billAmount*tipRate/100;
    float totalAmount = tipAmount+billAmount;
    self.tipLabel.text = [NSString stringWithFormat:@"$%0.2f",tipAmount];
    self.totalLabel.text = [NSString stringWithFormat:@"$%0.2f",totalAmount];
}

- (void) updateValues {
    
    float billAmount = [self.billTextField.text floatValue];
    
    NSArray *tipValues = @[@(0.1),@(0.15),@(0.2)];
    float tipAmount = billAmount*[tipValues[self.tipControl.selectedSegmentIndex] floatValue];
    float totalAmount = tipAmount+billAmount;
    self.tipLabel.text = [NSString stringWithFormat:@"$%0.2f",tipAmount];
    self.totalLabel.text = [NSString stringWithFormat:@"$%0.2f",totalAmount];
}

- (void)onSettingsButton {
    [self.navigationController pushViewController:[[SettingsViewController alloc] init] animated:YES];
}

- (IBAction) useDefault:(id)sender {
    
    [self firstValues];
}

- (IBAction)changeTipDate:(id)sender {
    [self.view endEditing:YES];
    [self updateValues];
}

@end
