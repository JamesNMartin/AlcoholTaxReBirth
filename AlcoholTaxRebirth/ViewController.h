//
//  ViewController.h
//  AlcoholTaxRebirth
//
//  Created by James Martin on 2/3/15.
//  Copyright (c) 2015 James Martin. All rights reserved.
//
#import <mach/mach.h>
#import <UIKit/UIKit.h>
#import <IonIcons.h>
#import <ionicons-codes.h>
#import <MessageUI/MessageUI.h>
#import <CRToast.h>
#import "BottleTaxes.h"
#import <AMSlideMenuProtocols.h>

@interface ViewController : UIViewController <UIActionSheetDelegate, MFMailComposeViewControllerDelegate, UITextFieldDelegate, UITextViewDelegate>


@property (strong, nonatomic) IBOutlet UIBarButtonItem *shareButton;
@property (strong, nonatomic) IBOutlet UITextField *salePrice;
@property (strong, nonatomic) IBOutlet UIButton *helpButton;
@property (strong, nonatomic) IBOutlet UISegmentedControl *selectSize;
@property (strong, nonatomic) IBOutlet UILabel *totalPrice;
@property (strong, nonatomic) IBOutlet UISwitch *taxToggle;
@property (strong, nonatomic) IBOutlet UIButton *heartButton;

//HIDE YO LABELS GURL #############################################
@property (strong, nonatomic) IBOutlet UILabel *showTaxesAddedLabel;
@property (strong, nonatomic) IBOutlet UILabel *stateTaxLabel;
@property (strong, nonatomic) IBOutlet UILabel *stateTaxLabelPrice;
@property (strong, nonatomic) IBOutlet UILabel *literTaxLabel;
@property (strong, nonatomic) IBOutlet UILabel *literTaxLabelPrice;
@property (strong, nonatomic) IBOutlet UILabel *totalTaxLabel;
@property (strong, nonatomic) IBOutlet UILabel *totalTaxLabelPrice;
//####################################################################

-(IBAction)taxToggle:(id)sender;
-(IBAction)share:(id)sender;
-(IBAction)helpButton:(id)sender;
-(IBAction)size:(id)sender;
-(IBAction)heartButton:(id)sender;

-(void)brightnessChanged;

@end


