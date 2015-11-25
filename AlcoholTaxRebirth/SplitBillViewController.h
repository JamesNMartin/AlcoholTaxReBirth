//
//  SplitBillViewController.h
//  AlcoholTaxRebirth
//
//  Created by James Martin on 4/6/15.
//  Copyright (c) 2015 James Martin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BottleTaxes.h"
#import <CRToast.h>
#import <IonIcons.h>
#import "BSKeyboardControls.h"

@interface SplitBillViewController : UIViewController <UITextFieldDelegate, UITextViewDelegate,BSKeyboardControlsDelegate>

//KEYBOARD CONTROLS NEEDS THIS ####################################
@property (nonatomic, strong) BSKeyboardControls *keyboardControls;

@property (strong, nonatomic) IBOutlet UITextField *salePrice;
@property (strong, nonatomic) IBOutlet UISegmentedControl *selectSize;
@property (strong, nonatomic) IBOutlet UIStepper *stepper;
@property (strong, nonatomic) IBOutlet UILabel *stepperResult;
@property (strong, nonatomic) IBOutlet UILabel *totalPrice;
@property (strong, nonatomic) IBOutlet UILabel *pricePerPseron;
@property (strong, nonatomic) IBOutlet UIButton *helpButton;

- (IBAction)stepperValue:(id)sender;
- (IBAction)emptySale:(id)sender;
- (IBAction)helpButton:(id)sender;

@end
