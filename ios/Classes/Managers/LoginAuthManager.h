//
//  LoginAuthManager.h
//  flutter_mob_share
//
//  Created by Mark on 2019/6/5.
//

#import <Foundation/Foundation.h>
#import <Flutter/Flutter.h>
#import <ShareSDK/ShareSDK.h>
NS_ASSUME_NONNULL_BEGIN

@interface LoginAuthManager : NSObject

+(LoginAuthManager *)loginAuthWithMethodCall:(FlutterMethodCall *)call
                                      result:(FlutterResult)result;

@end

NS_ASSUME_NONNULL_END
