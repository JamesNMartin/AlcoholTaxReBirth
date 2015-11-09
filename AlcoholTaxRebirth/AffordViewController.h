//
//  AffordViewController.h
//  AlcoholTaxRebirth
//
//  Created by James Martin on 2/4/15.
//  Copyright (c) 2015 James Martin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <IonIcons.h>
#import <ionicons-codes.h>
#import "BottleTaxes.h"
#import <CRToast.h>

@interface AffordViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIBarButtonItem *closeButton;
@property (strong, nonatomic) IBOutlet UITextField *amountOnHand;
@property (strong, nonatomic) IBOutlet UIButton *helpButton;
@property (strong, nonatomic) IBOutlet UISegmentedControl *selectSize;
@property (strong, nonatomic) IBOutlet UILabel *canAffordLabel;

//- (IBAction)closeButton:(id)sender;
- (IBAction)helpButton:(id)sender;
- (IBAction)size:(id)sender;

@end
