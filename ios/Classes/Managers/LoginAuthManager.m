//
//  LoginAuthManager.m
//  flutter_mob_share
//
//  Created by Mark on 2019/6/5.
//

#import "LoginAuthManager.h"
#import "LoginResponse.h"
#import <MJExtension.h>
@interface LoginAuthManager ()



@end
@implementation LoginAuthManager

+ (LoginAuthManager *)loginAuthWithMethodCall:(FlutterMethodCall *)call result:(FlutterResult)result{
    LoginAuthManager *manager = [LoginAuthManager new];
    [manager _doActionWithCall:call result:result];
    return manager;
}

-(void)_doActionWithCall:(FlutterMethodCall *)call result:(FlutterResult)result{
    NSString *funcName = [NSString stringWithFormat:@"%@:",call.method];
    if ([self respondsToSelector:NSSelectorFromString(funcName)]) {
        [self performSelector:NSSelectorFromString(funcName) withObject:result];
    }
}
/// 微信登录
-(void)loginToWechat:(FlutterResult)result{
    [self _loginWithPlatform:SSDKPlatformTypeWechat result:result];
}
/// qq 登录
-(void)loginToQQ:(FlutterResult)result{
    [self _loginWithPlatform:SSDKPlatformTypeQQ result:result];
}
/// 微博登录
-(void)loginToSina:(FlutterResult)result{
    [self _loginWithPlatform:SSDKPlatformTypeSinaWeibo result:result];
}

-(void)_loginWithPlatform:(SSDKPlatformType)platform result:(FlutterResult)result{
    [ShareSDK getUserInfo:platform
           onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
               if(result){
                   result([LoginResponse installFromSSDKUser:user state:state].mj_JSONObject);
               }
           }];
}

@end
