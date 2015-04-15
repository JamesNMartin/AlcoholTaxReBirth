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
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.79 green:0.25 blue:0.27 alpha:1.00];
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)stepperValue:(id)sender
{
    double salePrice = [_salePrice.text doubleValue];
    double splitValue = [_stepper value];
    
    
    NSString *splitString = [[NSString alloc]
                             initWithFormat:@"%.0f Ways",splitValue];
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
            _stepperResult.text = @"2 Ways";
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
            _stepperResult.text = @"2 Ways";
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
            _stepperResult.text = @"2 Ways";
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
            _stepperResult.text = @"2 Ways";
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
