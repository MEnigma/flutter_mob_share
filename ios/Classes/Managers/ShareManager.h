//
//  ShareManager.h
//  flutter_mob_share
//
//  Created by Mark on 2019/6/5.
//

#import <Foundation/Foundation.h>
#import <Flutter/Flutter.h>
#import <ShareSDK/ShareSDK.h>
#import <MJExtension.h>

NS_ASSUME_NONNULL_BEGIN

@interface ShareManager : NSObject

/**
 便利构造

 @param call 方法
 @param result 结果回调
 @return 无所谓
 */
+(ShareManager *)shareWithMethodCall:(FlutterMethodCall *)call
                              result:(FlutterResult)result;



@end

NS_ASSUME_NONNULL_END
