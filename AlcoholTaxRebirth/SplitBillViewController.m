//
//  SplitBillViewController.m
//  AlcoholTaxRebirth
//
//  Created by James Martin on 4/6/15.
//  Copyright (c) 2015 James Martin. All rights reserved.
//

#import "SplitBillViewController.h"

@interface SplitBillViewController ()

@end

@implementation SplitBillViewController

double totalCost;
double stateTax;
double perPersonPrice;

- (void)viewDidLoad {
    
    NSArray *fields = @[self.salePrice];
    [self.keyboardControls setVisibleControls:BSKeyboardControlDone];
    [self setKeyboardControls:[[BSKeyboardControls alloc] initWithFields:fields]];
    [self.keyboardControls setDelegate:self];
    self.keyboardControls.doneTintColor = [UIColor colorWithRed:0.79 green:0.25 blue:0.27 alpha:1.00];

    [_salePrice becomeFirstResponder];
    
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.79 green:0.25 blue:0.27 alpha:1.00];
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (void)textViewDidBeginEditing:(UITextView *)textView
{
    [self.keyboardControls setActiveField:textView];
}
- (void)keyboardControlsDonePressed:(BSKeyboardControls *)keyboardControls
{
    [self.view endEditing:YES];
}
-(void) motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    if (![_salePrice.text isEqual: @""])
    {
        NSDictionary *options = @{
                                  kCRToastTextKey : @"Cleared!",
                                  kCRToastFontKey :[UIFont fontWithName:@"HelveticaNeue-LightItalic" size:20],
                                  kCRToastImageKey : [IonIcons imageWithIcon:ion_ios_checkmark_outline size:36.0 color:[UIColor whiteColor]],
                                  kCRToastTextAlignmentKey : @(NSTextAlignmentLeft),
                                  kCRToastBackgroundColorKey : [UIColor colorWithRed:0.79 green:0.25 blue:0.27 alpha:1.00],
                                  kCRToastNotificationTypeKey : @(CRToastTypeNavigationBar),
                                  kCRToastSubtitleTextAlignmentKey: @(NSTextAlignmentLeft),
                                  kCRToastAnimationInTypeKey : @(CRToastAnimationTypeSpring),
                                  kCRToastAnimationOutTypeKey : @(CRToastAnimationTypeSpring),
                                  kCRToastAnimationSpringDampingKey : @(.6),
                                  kCRToastAnimationInDirectionKey : @(CRToastAnimationDirectionTop),
                                  kCRToastAnimationOutDirectionKey : @(CRToastAnimationDirectionTop)
                                  };
        [CRToastManager showNotificationWithOptions:options
                                    completionBlock:^{
                                        NSLog(@"Completed");
                                    }];
        _salePrice.placeholder = @"Enter Sale Price To Be Split";
        _salePrice.text = @"";
        _stepper.value = 2;
        _stepperResult.text = @"2 ways";
        _pricePerPseron.text = @"$0.00";
        _totalPrice.text = @"$0.00";
    }
    
    if (![_salePrice.text isEqual:@"$0.00"])
    {
        
    }
    
}
- (IBAction)helpButton:(id)sender
{
    NSString *string = @"Type the tag price and the app will calculate the tax, then split it by the number of people you set. \n(Max. 100)";
    
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"How to Use" message:string delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:nil, nil];
    [alert show];
}
-(IBAction)emptySale:(id)sender
{
    printf("Just showing error");
    double salePrice = [_salePrice.text doubleValue];
    
    while (salePrice == 0)
    {
        _stepperResult.text = @"2 ways";
        NSDictionary *options = @{
                                  kCRToastTextKey : @"No sale price is entered.\nPlease enter a sale price and try again.",
                                  kCRToastFontKey :[UIFont fontWithName:@"HelveticaNeue-LightItalic" size:17],
                                  kCRToastImageKey:[IonIcons imageWithIcon:ion_sad_outline size:36.0 color:[UIColor whiteColor]],
                                  kCRToastTextAlignmentKey : @(NSTextAlignmentLeft),
                                  kCRToastBackgroundColorKey : [UIColor colorWithRed:0.79 green:0.25 blue:0.27 alpha:1.00],
                                  kCRToastNotificationTypeKey : @(CRToastTypeNavigationBar),
                                  kCRToastSubtitleTextAlignmentKey: @(NSTextAlignmentLeft),
                                  kCRToastAnimationInTypeKey : @(CRToastAnimationTypeSpring),
                                  kCRToastAnimationOutTypeKey : @(CRToastAnimationTypeSpring),
                                  kCRToastTimeIntervalKey : @(4),
                                  kCRToastAnimationSpringDampingKey : @(.65),
                                  kCRToastAnimationInDirectionKey : @(CRToastAnimationDirectionTop),
                                  kCRToastAnimationOutDirectionKey : @(CRToastAnimationDirectionTop)
                                  };
        [CRToastManager showNotificationWithOptions:options
                                    completionBlock:^{
                                        //NSLog(@"Completed");
                                    }];
        break;
    }}

- (IBAction)stepperValue:(id)sender
{
    NSLog(@"%.0f",[_stepper value]);

    double salePrice = [_salePrice.text doubleValue];
    double splitValue = [_stepper value];
    
    
    NSString *splitString = [[NSString alloc]
                             initWithFormat:@"%.0f ways",splitValue];
    _stepperResult.text = splitString;
    

    while (salePrice >= 0 && _stepper.value >= 2 && _selectSize.selectedSegmentIndex == 0) {
        _salePrice.placeholder = @"Enter Sale Price To Be Split";
        totalCost = salePrice * salesTax + pintTax + salePrice;
        stateTax = salePrice * salesTax;
        perPersonPrice = ((totalCost) / splitValue);
        
        
        NSString *totalString = [[NSString alloc]
                                 initWithFormat:@"$%.2f for 375mL", totalCost];
        _totalPrice.text = totalString;
        
        
        
        NSString *perPersonString = [[NSString alloc]
                                     initWithFormat:@"$%.2f Per Person",perPersonPrice];
        _pricePerPseron.text = perPersonString;
        
        /*
        printf("%.2f total cost \n",totalCost);
        printf("%.2f WA state tax \n",stateTax);
        printf("%.2f per person price \n",perPersonPrice);
        printf("%.0f number of split \n",splitValue);
        printf("\n");
        */
        
        if (salePrice == 0)
        {
            _totalPrice.text = @"$0.00";
            _pricePerPseron.text = @"$0.00";
            _stepper.value = 2;
            _stepperResult.text = @"2 ways";
            break;
        }
        if (totalString > 0 ) {
            break;
        }
    }
    while (salePrice >= 0 && _stepper.value >= 2 && _selectSize.selectedSegmentIndex == 1) {
        _salePrice.placeholder = @"Enter Sale Price To Be Split";
        totalCost = salePrice * salesTax + fifthTax + salePrice;
        stateTax = salePrice * salesTax;
        perPersonPrice = ((totalCost) / splitValue);
        
        
        NSString *totalString = [[NSString alloc]
                                 initWithFormat:@"$%.2f for 750mL", totalCost];
        _totalPrice.text = totalString;
        
        
        
        NSString *perPersonString = [[NSString alloc]
                                     initWithFormat:@"$%.2f Per Person",perPersonPrice];
        _pricePerPseron.text = perPersonString;
        
        /*
        printf("%.2f total cost \n",totalCost);
        printf("%.2f WA state tax \n",stateTax);
        printf("%.2f per person price \n",perPersonPrice);
        printf("%.0f number of split \n",splitValue);
        printf("\n");
        */
        
        if (salePrice == 0)
        {
            _totalPrice.text = @"$0.00";
            _pricePerPseron.text = @"$0.00";
            _stepper.value = 2;
            _stepperResult.text = @"2 ways";
            break;
        }
        if (totalString > 0 ) {
            break;
        }
    }
    while (salePrice >= 0 && _stepper.value >= 2 && _selectSize.selectedSegmentIndex == 2) {
        _salePrice.placeholder = @"Enter Sale Price To Be Split";
        totalCost = salePrice * salesTax + halfGalTax + salePrice;
        stateTax = salePrice * salesTax;
        perPersonPrice = ((totalCost) / splitValue);
        
        
        NSString *totalString = [[NSString alloc]
                                 initWithFormat:@"$%.2f for 1.75L", totalCost];
        _totalPrice.text = totalString;
        
        
        
        NSString *perPersonString = [[NSString alloc]
                                     initWithFormat:@"$%.2f Per Person",perPersonPrice];
        _pricePerPseron.text = perPersonString;
        
        /*
        printf("%.2f total cost \n",totalCost);
        printf("%.2f WA state tax \n",stateTax);
        printf("%.2f per person price \n",perPersonPrice);
        printf("%.0f number of split \n",splitValue);
        printf("\n");
        */
        
        if (salePrice == 0)
        {
            _totalPrice.text = @"$0.00";
            _pricePerPseron.text = @"$0.00";
            _stepper.value = 2;
            _stepperResult.text = @"2 ways";
            break;
        }
        if (totalString > 0 ) {
            break;
        }
    }
    while (salePrice >= 0 && _stepper.value >= 2 && _selectSize.selectedSegmentIndex == 3) {
        _salePrice.placeholder = @"Enter Sale Price To Be Split";
        totalCost = salePrice * salesTax + fortyTax + salePrice;
        stateTax = salePrice * salesTax;
        perPersonPrice = ((totalCost) / splitValue);
        
        
        NSString *totalString = [[NSString alloc]
                                 initWithFormat:@"$%.2f for 40oz", totalCost];
        _totalPrice.text = totalString;
        
        
        
        NSString *perPersonString = [[NSString alloc]
                                     initWithFormat:@"$%.2f Per Person",perPersonPrice];
        _pricePerPseron.text = perPersonString;
        
        /*
        printf("%.2f total cost \n",totalCost);
        printf("%.2f WA state tax \n",stateTax);
        printf("%.2f per person price \n",perPersonPrice);
        printf("%.0f number of split \n",splitValue);
        printf("\n");
        */
        
        if (salePrice == 0)
        {
            _totalPrice.text = @"$0.00";
            _pricePerPseron.text = @"$0.00";
            _stepper.value = 2;
            _stepperResult.text = @"2 ways";
            break;
        }
        if (totalString > 0 ) {
            break;
        }
    }
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
@end
