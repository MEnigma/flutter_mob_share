//
//  ConfigManager.m
//  flutter_mob_share
//
//  Created by Mark on 2019/6/5.
//

#import "ConfigManager.h"

@implementation ConfigManager
-(void)registPlatformWithMethodCall:(FlutterMethodCall *)methodCall result:(FlutterResult)result{
    if(![methodCall.method isEqualToString:@"regist"]){
        if(result)
            result(ConfigResult.methodCallOnNull.mj_JSONObject);
    }
    
    if(!methodCall.arguments)
        result(ConfigResult.normalFail.mj_JSONObject);
    ConfigModel *config = [ConfigModel.new mj_setKeyValues:methodCall.arguments];
    
    [ShareSDK registPlatforms:^(SSDKRegister *platformsRegister) {
        switch (config.platform) {
                
            case SSDKPlatformSubTypeQQFriend:
            case SSDKPlatformSubTypeQZone:
            case SSDKPlatformTypeQQ:[platformsRegister setupQQWithAppId:config.appid appkey:config.appkey];break;
                
            case SSDKPlatformSubTypeWechatFav:
            case SSDKPlatformSubTypeWechatSession:
            case SSDKPlatformSubTypeWechatTimeline:
            case SSDKPlatformTypeWechat:[platformsRegister setupWeChatWithAppId:config.appid appSecret:config.appsecret];break;
                
            case SSDKPlatformTypeSinaWeibo:[platformsRegister setupSinaWeiboWithAppkey:config.appkey appSecret:config.appsecret redirectUrl:config.redirectUrl];break;
                
            case SSDKPlatformTypeUnknown:break;
                
            case SSDKPlatformTypeTencentWeibo:
                [platformsRegister setupTencentWeiboWithAppkey:config.appkey appSecret:config.appsecret redirectUrl:config.redirectUrl];
                break;
                
            case SSDKPlatformTypeDouBan:
                [platformsRegister setupDouBanWithApikey:config.appkey appSecret:config.appsecret redirectUrl:config.redirectUrl];
                break;
                
            case SSDKPlatformTypeRenren:
                [platformsRegister setupRenRenWithAppId:config.appid appKey:config.appkey secretKey:config.appsecret authType:SSDKAuthorizeTypeBoth];
                break;
                
            default:
                //暂不支持
                break;
        }
        if(result)result(ConfigResult.normalSucceed.mj_JSONObject);
    }];
    
}
@end


