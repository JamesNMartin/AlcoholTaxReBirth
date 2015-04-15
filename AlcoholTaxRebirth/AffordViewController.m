//
//  AffordViewController.m
//  AlcoholTaxRebirth
//
//  Created by James Martin on 2/4/15.
//  Copyright (c) 2015 James Martin. All rights reserved.
//

#import "AffordViewController.h"

@interface AffordViewController ()

@end

@implementation AffordViewController

double canAffordCost;
double stateTax;

-(void) motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    if (![_amountOnHand.text isEqual: @""])
    {
        NSDictionary *options = @{
                                  kCRToastTextKey : @"Cleared!",
                                  kCRToastFontKey :[UIFont fontWithName:@"HelveticaNeue-LightItalic" size:20],
                                  kCRToastImageKey : [IonIcons imageWithIcon:ion_ios_checkmark_outline size:36.0 color:[UIColor whiteColor]],
                                  kCRToastTextAlignmentKey : @(NSTextAlignmentLeft),
                                  kCRToastBackgroundColorKey : [UIColor colorWithRed:0.28 green:0.19 blue:0.59 alpha:1.00],
                                  kCRToastNotificationTypeKey : @(CRToastTypeNavigationBar),
                                  kCRToastSubtitleTextAlignmentKey: @(NSTextAlignmentCenter),
                                  kCRToastAnimationInTypeKey : @(CRToastAnimationTypeGravity),
                                  kCRToastAnimationOutTypeKey : @(CRToastAnimationTypeLinear),
                                  kCRToastAnimationInDirectionKey : @(CRToastAnimationDirectionTop),
                                  kCRToastAnimationOutDirectionKey : @(CRToastAnimationDirectionTop)
                                  };
        [CRToastManager showNotificationWithOptions:options
                                    completionBlock:^{
                                        NSLog(@"Completed");
                                    }];
        _amountOnHand.placeholder = @"Enter Sale Price";
        _amountOnHand.text =@"";
        _canAffordLabel.text = @"$0.00";
        canAffordCost = 0;
    }
    
    if (![_canAffordLabel.text isEqual:@"$0.00"])
    {
        _amountOnHand.placeholder = @"Enter Sale Price";
        _canAffordLabel.text = @"$0.00";
        _amountOnHand.text =@"";
        canAffordCost = 0;
    }
    
}
- (void)viewDidLoad {
    //[_amountOnHand becomeFirstResponder];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.28 green:0.19 blue:0.59 alpha:1.00];
    [self.closeButton setTitle:nil];
    [self.closeButton setImage:[IonIcons imageWithIcon:ion_ios_calculator_outline size:30.0 color:[UIColor colorWithRed:0.28 green:0.19 blue:0.59 alpha:1.00]]];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)closeButton:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)helpButton:(id)sender
{
    
}

-(IBAction)size:(id)sender
{
    double amountOnHand = [_amountOnHand.text doubleValue];
    while (amountOnHand >= 0 && _selectSize.selectedSegmentIndex == 0)
    {
        _amountOnHand.placeholder = @"Enter Amount You Have";
        canAffordCost = (amountOnHand - pintTax) / 1.205;
        NSString *canAffordString = [[NSString alloc]
                                     initWithFormat:@"$%.2f", canAffordCost];
        _canAffordLabel.text = canAffordString;
        if (amountOnHand == 0) {
            _canAffordLabel.text = @"$0.00";
            break;
        }
        if (canAffordString > 0) {
            break;
        }
    }
    while (amountOnHand >= 0 && _selectSize.selectedSegmentIndex == 1)
    {
        _amountOnHand.placeholder = @"Enter Amount You Have";
        canAffordCost = (amountOnHand - fifthTax) / 1.205;
        NSString *canAffordString = [[NSString alloc]
                                     initWithFormat:@"$%.2f", canAffordCost];
        _canAffordLabel.text = canAffordString;
        if (amountOnHand == 0) {
            _canAffordLabel.text = @"$0.00";
            break;
        }
        if (canAffordString > 0) {
            break;
        }
    }
    while (amountOnHand >= 0 && _selectSize.selectedSegmentIndex == 2)
    {
        _amountOnHand.placeholder = @"Enter Amount You Have";
        canAffordCost = (amountOnHand - halfGalTax) / 1.205;
        NSString *canAffordString = [[NSString alloc]
                                     initWithFormat:@"$%.2f", canAffordCost];
        _canAffordLabel.text = canAffordString;
        if (amountOnHand == 0) {
            _canAffordLabel.text = @"$0.00";
            break;
        }
        if (canAffordString > 0) {
            break;
        }
    }
    while (amountOnHand >= 0 && _selectSize.selectedSegmentIndex == 3)
    {
        _amountOnHand.placeholder = @"Enter Amount You Have";
        canAffordCost = (amountOnHand - fortyTax) / 1.205;
        NSString *canAffordString = [[NSString alloc]
                                     initWithFormat:@"$%.2f", canAffordCost];
        _canAffordLabel.text = canAffordString;
        if (amountOnHand == 0) {
            _canAffordLabel.text = @"$0.00";
            break;
        }
        if (canAffordString > 0) {
            break;
        }
    }
}
@end

