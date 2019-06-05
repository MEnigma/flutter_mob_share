//
//  Config.h
//  flutter_mob_share
//
//  Created by Mark on 2019/6/5.
//

#import <Foundation/Foundation.h>
#import <ShareSDK/ShareSDK.h>
NS_ASSUME_NONNULL_BEGIN


/// 平台注册配置信息
@interface ConfigModel : NSObject

/** 平台 */
@property (nonatomic ,assign) SSDKPlatformType platform;

/** appkey */
@property (nonatomic ,copy) NSString * appkey;

/** app id */
@property (nonatomic ,copy) NSString * appid;

/** appsecret */
@property (nonatomic ,copy) NSString * appsecret;

/** redirectUrl 回调地址,eg:微博 */
@property (nonatomic ,copy) NSString * redirectUrl;
@end

/// 配置结果
@interface ConfigResult : NSObject

+(ConfigResult *)normalFail;
+(ConfigResult *)normalSucceed;
+(ConfigResult *)methodCallOnNull;
/** 成功 */
@property (nonatomic ,assign) BOOL succeed;

/** message */
@property (nonatomic ,copy) NSString * message;

@end

NS_ASSUME_NONNULL_END
