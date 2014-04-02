//
//  LoginViewController.m
//  ReactiveLoginDemo
//
//  Created by Belényesi Viktor on 01/04/14.
//  Copyright (c) 2014 Belényesi Viktor. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginService.h"
#import "LoginViewModel.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

@implementation LoginViewController {
    LoginViewModel* vm;
}

- (void)viewDidLoad {
    vm = [LoginViewModel new];
    vm.loginService = [LoginService new];

    self.loginButton.rac_command = vm.loginCommand;

    RAC(vm, username) = self.usernameField.rac_textSignal;
    RAC(vm, password) = self.passwordField.rac_textSignal;

    RAC(self.activityIndicator, hidden) = RACObserve(vm, isActivityIndicatorHidden);
    RAC(self.loginButton, hidden) = RACObserve(vm, isLoginButtonHidden);
    RAC(self.errormessageLabel, text) = RACObserve(vm, errorMessage);
}

@end
