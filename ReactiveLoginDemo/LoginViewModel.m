//
// Created by Belényesi Viktor on 02/04/14.
// Copyright (c) 2014 Belényesi Viktor. All rights reserved.
//

#import "LoginViewModel.h"
#import "LoginService.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

@implementation LoginViewModel

- (instancetype)init {
    self = [super init];
    if (self) {
        RACSignal* (^loginSignalBlock)(id) = ^RACSignal*(id input) {
            return [RACSignal createSignal:^RACDisposable*(id <RACSubscriber> subscriber) {
                [self.loginService loginWithUserName:self.username
                                         andPassword:self.password
                                    andCallBackBlock:^(BOOL successful) {
                                        [subscriber sendNext:@(successful)];
                                        [subscriber sendCompleted];
                                    }];
                return nil;
            }];
        };
        
        _loginCommand = [[RACCommand alloc] initWithSignalBlock:loginSignalBlock];

        RACSignal* loginSuccessSignal = [self.loginCommand.executionSignals flatten];
        
        // bind
        RAC(self, errorMessage) = [loginSuccessSignal map:^id(NSNumber* successful) {
            return successful.boolValue ? @"login was successful" : @"wrong username or password";
        }];
        RAC(self, isActivityIndicatorHidden) = [self.loginCommand.executing not];
        RAC(self, isLoginButtonHidden) = self.loginCommand.executing;
    }
    return self;
}

@end
