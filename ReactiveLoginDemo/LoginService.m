//
// Created by Belényesi Viktor on 02/04/14.
// Copyright (c) 2014 Belényesi Viktor. All rights reserved.
//

#import "LoginService.h"

@implementation LoginService

- (void)loginWithUserName:(NSString*)username
              andPassword:(NSString*)password
         andCallBackBlock:(void (^)(BOOL successful))loginCallBackBlock {

    // fake network activity
    CFRunLoopRunInMode(kCFRunLoopDefaultMode, 1.0f, false);

    BOOL wasSuccessful = [username isEqualToString:@"foo"] && [password isEqualToString:@"bar"];

    if (wasSuccessful) {
        loginCallBackBlock(true);
    } else {
        loginCallBackBlock(false);
    }
}

@end
