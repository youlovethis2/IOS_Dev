//
//  SettingsViewController.m
//  tipcalculator
//
//  Created by Shangqing Zhang on 1/21/15.
//  Copyright (c) 2015 Shangqing Zhang. All rights reserved.
//

#import "SettingsViewController.h"
#import "TipViewController.h"
int savedRate;

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UIButton *button ;
@property (weak, nonatomic) IBOutlet UIButton *Clean;
@property (weak, nonatomic) IBOutlet UITextField *DefaultRateController;
@property (weak, nonatomic) IBOutlet UIButton *Save;
@property (weak, nonatomic) IBOutlet UILabel *rate;


- (IBAction)onTap:(id)sender;

@end


@implementation SettingsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)SaveDefaultValue:(id)sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
  
    [defaults setInteger:savedRate forKey:@"aa"];
    [defaults synchronize];
    [self.navigationController popToRootViewControllerAnimated:TRUE];
    NSLog(@"Button  clicked.");
}


- (IBAction) CleanUp:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:TRUE];
    [self updateValues];
}
- (IBAction)sliderValueChange:(UISlider *)sender {
    savedRate = [@((int)sender.value) intValue];
    self.rate.text = [@((int)sender.value) stringValue];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) updateValues {
    
    int totalAmount = 0;
    
    self.DefaultRateController.text = [NSString stringWithFormat:@"%d",totalAmount];
}



- (IBAction)onTap:(id)sender {
    [self.view endEditing:YES];
}
@end
