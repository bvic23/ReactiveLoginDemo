//
//  LoginViewModelTest.m
//  LoginViewModelTest
//
//  Created by Belényesi Viktor on 02/04/14.
//  Copyright (c) 2014 Belényesi Viktor. All rights reserved.
//


#import <Kiwi/Kiwi.h>
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "LoginViewModel.h"
#import "LoginService.h"

SPEC_BEGIN(LoginViewModelSpec)

describe(@"LoginViewModel", ^{

    __block LoginViewModel* sut = nil;
    __block LoginService* loginServiceMock = nil;

    beforeEach(^{
        loginServiceMock = [LoginService nullMock];
        sut = [LoginViewModel new];
        sut.loginService = loginServiceMock;
        sut.username = @"foo";
        sut.password = @"bar";
    });

    afterEach(^{
        sut = nil;
        loginServiceMock = nil;
    });

    void(^mockLogin)(BOOL) = ^void(BOOL mockResult) {
        [loginServiceMock stub:@selector(loginWithUserName:andPassword:andCallBackBlock:) withBlock:^id(NSArray* params) {
            void (^loginCallBackBlock)(BOOL successful) = params[2];
            loginCallBackBlock(mockResult);
            return nil;
        }];

    };

    context(@"error message", ^{

        it(@"shows 'login was success' if login was successful", ^{
            // given
            mockLogin(YES);

            // when
            [sut.loginCommand execute:nil];

            // then
            [[expectFutureValue(sut.errorMessage) shouldEventually] equal:@"login was successful"];
        });

        it(@"shows 'wrong username or password' if login failed", ^{
            // given
            mockLogin(NO);

            // when
            [sut.loginCommand execute:nil];

            // then
            [[expectFutureValue(sut.errorMessage) shouldEventually] equal:@"wrong username or password"];
        });

    });

    context(@"login button's visibilty", ^{

        it(@"hides if login is in-progress", ^{
            // when
            [(RACSubject*)sut.loginCommand.executing sendNext:@YES];

            // then
            [[theValue(sut.isLoginButtonHidden) should] beYes];
        });

        it(@"show if login is not in-progress", ^{
            // when
            [(RACSubject*)sut.loginCommand.executing sendNext:@NO];

            // then
            [[theValue(sut.isLoginButtonHidden) should] beNo];
        });

    });

    context(@"activity indicator's visibilty", ^{

        it(@"shows if login is in-progress", ^{
            // when
            [(RACSubject*)sut.loginCommand.executing sendNext:@YES];

            // then
            [[theValue(sut.isActivityIndicatorHidden) should] beNo];
        });

        it(@"hides if login is not in-progress", ^{
            // when
            [(RACSubject*)sut.loginCommand.executing sendNext:@NO];

            // then
            [[theValue(sut.isActivityIndicatorHidden) should] beYes];
        });

    });

    context(@"error color", ^{

        it(@"black if login was successful", ^{
            // given
            mockLogin(YES);

            // when
            [sut.loginCommand execute:nil];

            // then
            [[expectFutureValue(sut.errorColor) shouldEventually] equal:[UIColor blackColor]];
        });

        it(@"red' if login failed", ^{
            // given
            mockLogin(NO);

            // when
            [sut.loginCommand execute:nil];

            // then
            [[expectFutureValue(sut.errorColor) shouldEventually] equal:[UIColor redColor]];
        });

    });

});

SPEC_END
