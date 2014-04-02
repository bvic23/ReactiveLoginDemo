//
//  LoginViewController.m
//  ReactiveLoginDemo
//
//  Created by Belényesi Viktor on 01/04/14.
//  Copyright (c) 2014 Belényesi Viktor. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginService.h"

@implementation LoginViewController

- (void)viewDidLoad {
    self.errormessageLabel.text = @"";
    self.activityIndicator.hidden = YES;
    [self.loginButton addTarget:self action:@selector(logIn:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)logIn:(id)sender {
    self.activityIndicator.hidden = NO;
    self.errormessageLabel.text = @"";
    self.loginButton.hidden = YES;

    NSString *username = self.usernameField.text;
    NSString *password = self.passwordField.text;

    [[LoginService new] loginWithUserName:username andPassword:password andCallBackBlock:^(BOOL successful) {
        if (successful) {
            self.errormessageLabel.text = @"login was successful";
        } else {
            self.errormessageLabel.text = @"wrong username or password";
        }
        self.activityIndicator.hidden = YES;
        self.loginButton.hidden = NO;
    }];

}

@end
