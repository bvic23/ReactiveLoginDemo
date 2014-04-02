//
// Created by Belényesi Viktor on 02/04/14.
// Copyright (c) 2014 Belényesi Viktor. All rights reserved.
//

@class RACCommand;
@class RACSignal;
@class LoginService;

@interface LoginViewModel : NSObject

// dependencies
@property (nonatomic, strong) LoginService* loginService;

// commands
@property (nonatomic, readonly) RACCommand* loginCommand;

// inputs
@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSString *password;

// outputs
@property (nonatomic, readonly) BOOL isActivityIndicatorHidden;
@property (nonatomic, readonly) BOOL isLoginButtonHidden;
@property (nonatomic, readonly) NSString* errorMessage;

@end
