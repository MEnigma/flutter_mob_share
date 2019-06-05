//
//  ShareManager.m
//  flutter_mob_share
//
//  Created by Mark on 2019/6/5.
//

#import "ShareManager.h"
#import "ShareConfig.h"
@interface ShareManager()

/** 方法 */
@property (nonatomic ,strong) FlutterMethodCall *call;

/** 回调 */
@property (nonatomic ,copy) FlutterResult result;

@end
@implementation ShareManager
+(ShareManager *)shareWithMethodCall:(FlutterMethodCall *)call result:(FlutterResult)result{
    ShareManager *manager = [ShareManager new];
    manager.call = call;
    manager.result = result;
    [manager _doAction];
    return manager;
}

-(void)_doAction{
    if ([self respondsToSelector:NSSelectorFromString(self.call.method)]) {
        [self performSelector:NSSelectorFromString(self.call.method)];
    }else{
        _result(FlutterMethodNotImplemented);
    }
}

/// 微博分享
-(void)shareToSina{
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    SinaWeiboShare *weiboconfig = [SinaWeiboShare.new mj_setKeyValues:self.call.arguments];
    [param SSDKSetupSinaWeiboShareParamsByText:weiboconfig.contentText
                                         title:weiboconfig.title
                                        images:weiboconfig.images?weiboconfig.images : nil
                                         video:weiboconfig.vedioPath ? weiboconfig.vedioPath : nil
                                           url:weiboconfig.url ? [NSURL URLWithString:weiboconfig.url] : nil
                                      latitude:weiboconfig.latitude
                                     longitude:weiboconfig.longitude
                                      objectID:nil
                                isShareToStory:weiboconfig.isShareToStory
                                          type:weiboconfig.contentType];
    if (self.result) {
        ShareResult *result = [ShareResult new];
        result.state = SSDKResponseStateBegin;
        self.result(result.mj_JSONObject);
    }
}

/// qq分享
-(void)shareToQQ{
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    
    QQShare *config = [QQShare.new mj_setKeyValues:self.call.arguments];
    
    [param SSDKSetupQQParamsByText:config.contentText
                             title:config.title
                               url:config.url?[NSURL URLWithString:config.url] : nil
                     audioFlashURL:config.audioPath ? [NSURL fileURLWithPath:config.audioPath] : nil
                     videoFlashURL:config.vedioPath ? [NSURL URLWithString:config.vedioPath] : nil
                        thumbImage:config.thumbnailPath ? [NSData dataWithContentsOfFile:config.thumbnailPath] : nil
                            images:nil
                              type:config.contentType
                forPlatformSubType:SSDKPlatformSubTypeQQFriend];
    
    __weak __typeof(self) im = self;
    [ShareSDK share:SSDKPlatformSubTypeQQFriend
         parameters:param
     onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
         if (im.result) {
             ShareResult *response = [ShareResult.alloc init];
             response.state = state;
             im.result(response.mj_JSONObject);
         }
     }];
}

/// 微信好友分享
-(void)shareToWechatSession{
    __weak __typeof(self) im = self;
    WechatSessionShare *config = [WechatSessionShare.new mj_setKeyValues:self.call.arguments];
    [self _shareToWechatPlatformSubType:SSDKPlatformSubTypeWechatSession config:config response:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
        if (im.result) {
            ShareResult *response = [ShareResult.alloc init];
            response.state = state;
            im.result(response.mj_JSONObject);
        }
    }];
}

/// 微信朋友圈分享
-(void)shareToWechatTimeline{
    __weak __typeof(self) im = self;
    WechatTimelineShare *config = [WechatTimelineShare.new mj_setKeyValues:self.call.arguments];
    [self _shareToWechatPlatformSubType:SSDKPlatformSubTypeWechatTimeline config:config response:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
        if (im.result) {
            ShareResult *response = [ShareResult.alloc init];
            response.state = state;
            im.result(response.mj_JSONObject);
        }
    }];
}

/// 微信分享
-(void)_shareToWechatPlatformSubType:(SSDKPlatformType)subtype config:(WechatSessionShare *)config response:(SSDKShareStateChangedHandler)result{
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    
    [param SSDKSetupWeChatParamsByText:config.contentText
                                 title:config.title
                                   url:config.url ? [NSURL URLWithString:config.url] : nil
                            thumbImage:config.thumbnailPath ? [UIImage.alloc initWithContentsOfFile:config.thumbnailPath] : nil
                                 image:config.imagePath ? [UIImage.alloc initWithContentsOfFile:config.imagePath] :nil
                          musicFileURL:config.musicPath ? [NSURL fileURLWithPath:config.musicPath] : nil
                               extInfo:config.extinfo
                              fileData:config.filePath ? [NSData dataWithContentsOfFile:config.filePath] : nil
                          emoticonData:nil
                   sourceFileExtension:nil
                        sourceFileData:nil
                                  type:config.contentType
                    forPlatformSubType:subtype];
    
    [ShareSDK share:subtype parameters:param onStateChanged:result];
}

@end
