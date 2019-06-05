//
//  LoginResponse.h
//  flutter_mob_share
//
//  Created by Mark on 2019/6/5.
//

#import <Foundation/Foundation.h>
#import <ShareSDK/ShareSDK.h>
NS_ASSUME_NONNULL_BEGIN

@interface LoginResponse : NSObject

+(LoginResponse *)installFromSSDKUser:(SSDKUser*)userinf state:(SSDKResponseState)state;

/** 状态 */
@property (nonatomic ,assign) SSDKResponseState state;

/** 平台类型 */
@property (nonatomic ,assign) SSDKPlatformType platformType;

/** uid */
@property (nonatomic ,copy) NSString * uid;

/** nickname */
@property (nonatomic ,copy) NSString * nickname;

/** 头像 */
@property (nonatomic ,copy) NSString * icon;

/** 性别,0-男,1-女,2-位置 */
@property (nonatomic ,assign) NSInteger gender;

@end




NS_ASSUME_NONNULL_END
