//
//  SplitBillViewController.h
//  AlcoholTaxRebirth
//
//  Created by James Martin on 4/6/15.
//  Copyright (c) 2015 James Martin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BottleTaxes.h"

@interface SplitBillViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *salePrice;
@property (strong, nonatomic) IBOutlet UISegmentedControl *selectSize;
@property (strong, nonatomic) IBOutlet UIStepper *stepper;
@property (strong, nonatomic) IBOutlet UILabel *stepperResult;
@property (strong, nonatomic) IBOutlet UILabel *totalPrice;
@property (strong, nonatomic) IBOutlet UILabel *pricePerPseron;

- (IBAction)stepperValue:(id)sender;

@end
