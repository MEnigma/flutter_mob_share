#import "FlutterMobSharePlugin.h"

#import "ShareManager.h"
#import "ConfigManager.h"
#import "LoginAuthManager.h"

#import "Define.h"

@implementation FlutterMobSharePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
    
    // id注册
    FlutterMethodChannel *registChannel = [FlutterMethodChannel methodChannelWithName:CHANNEL_NAME_REGIST
                                                                      binaryMessenger:registrar.messenger];
    [registChannel setMethodCallHandler:^(FlutterMethodCall * _Nonnull call, FlutterResult  _Nonnull result) {
        if (call) {
            [[ConfigManager.alloc init] registPlatformWithMethodCall:call result:result];
        }
    }];
    
    // 平台分享
    FlutterMethodChannel *shareChannel = [FlutterMethodChannel methodChannelWithName:CHANNEL_NAME_SHARE
                                                                     binaryMessenger:registrar.messenger];
    [shareChannel setMethodCallHandler:^(FlutterMethodCall * _Nonnull call, FlutterResult  _Nonnull result) {
        if (call) {
            [ShareManager shareWithMethodCall:call result:result];
            
        }
    }];
    
    // 三方登录
    FlutterMethodChannel *loginChannel = [FlutterMethodChannel methodChannelWithName:CHANNEL_NAME_LOGIN_AUTH
                                                                     binaryMessenger:registrar.messenger];
    [loginChannel setMethodCallHandler:^(FlutterMethodCall * _Nonnull call, FlutterResult  _Nonnull result) {
        if (call) {
            [LoginAuthManager loginAuthWithMethodCall:call result:result];
        }
    }];
    
    
    
    FlutterMethodChannel* channel = [FlutterMethodChannel
                                     methodChannelWithName:@"flutter_mob_share"
                                     binaryMessenger:[registrar messenger]];
    FlutterMobSharePlugin* instance = [[FlutterMobSharePlugin alloc] init];
    [registrar addMethodCallDelegate:instance channel:channel];
    
    
    
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
    if ([@"getPlatformVersion" isEqualToString:call.method]) {
        result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
    } else {
        result(FlutterMethodNotImplemented);
    }
}




@end
