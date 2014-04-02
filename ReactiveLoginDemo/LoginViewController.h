//
//  LoginViewController.h
//  ReactiveLoginDemo
//
//  Created by Belényesi Viktor on 01/04/14.
//  Copyright (c) 2014 Belényesi Viktor. All rights reserved.
//

@interface LoginViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (weak, nonatomic) IBOutlet UILabel *errormessageLabel;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;

@end
