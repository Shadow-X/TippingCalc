//
//  SettingsViewController.m
//  TippingCalc
//
//  Created by Derek Ikegami on 1/8/14.
//  Copyright (c) 2014 Derek Ikegami. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

@property (weak, nonatomic) IBOutlet UISegmentedControl *defaultTippingControl;

- (void)saveSettings;

- (IBAction)onTap:(id)sender;

@end

@implementation SettingsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title =@"Settings";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    int intValue = [defaults integerForKey:@"defaultTipPerc"];
    self.defaultTippingControl.selectedSegmentIndex = intValue;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)saveSettings {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:self.defaultTippingControl.selectedSegmentIndex forKey:@"defaultTipPerc"];
    [defaults synchronize];
}

- (IBAction)onTap:(id)sender {
    [self saveSettings];
}

@end
