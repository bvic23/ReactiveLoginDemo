//
// Created by Belényesi Viktor on 02/04/14.
// Copyright (c) 2014 Belényesi Viktor. All rights reserved.
//

@interface LoginService : NSObject

- (void)loginWithUserName:(NSString*)username
              andPassword:(NSString*)password
         andCallBackBlock:(void (^)(BOOL successful))loginCallBackBlock;

@end
