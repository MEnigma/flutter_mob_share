//
//  ShareConfig.h
//  flutter_mob_share
//
//  Created by Mark on 2019/6/5.
//

#import <Foundation/Foundation.h>
#import <ShareSDK/ShareSDK.h>

NS_ASSUME_NONNULL_BEGIN

/// 分享基类
@interface ShareConfig : NSObject

/** 文本内容 */
@property (nonatomic ,copy) NSString * contentText;

/** 标题 */
@property (nonatomic ,copy) NSString * title;

/** url */
@property (nonatomic ,copy) NSString * url;

/** 缩略图本地地址 */
@property (nonatomic ,copy) NSString * thumbnailPath;

/** 原图本地地址 */
@property (nonatomic ,copy) NSString * imagePath;

/** 音乐文件地址 */
@property (nonatomic ,copy) NSString * musicPath;

/** 视频文件地址 */
@property (nonatomic ,copy) NSString * vedioPath;

/** 文件路径 */
@property (nonatomic ,copy) NSString * filePath;

/** 分享的内容类型 */
@property (nonatomic ,assign) SSDKContentType contentType;

/** 分享的平台 */
@property (nonatomic ,assign) SSDKPlatformType platformType;

@end

/// 微信朋友分享
@interface WechatSessionShare : ShareConfig

/** ext */
@property (nonatomic ,copy) NSString * extinfo;


/** emoticonData */
@property (nonatomic ,copy) NSString * emoticonPath;

@end

/// 朋友圈分享
@interface WechatTimelineShare : WechatSessionShare


@end

/// qq分享
@interface QQShare : ShareConfig

/** 音频本地路径 */
@property (nonatomic ,copy) NSString * audioPath;

@end

/// 新浪微博分享
@interface SinaWeiboShare : ShareConfig

/** 图片集合  传入参数可以为单张图片信息，也可以为一个NSArray，数组元素可以为UIImage、NSString（图片路径）、NSURL（图片路径）、SSDKImage。如: @"http://www.mob.com/images/logo_black.png" 或 @[@"http://www.mob.com/images/logo_black.png"] */
@property (nonatomic ,strong) NSArray <NSString *>* images;

/** latitude */
@property (nonatomic ,assign) double latitude;

/** longitude */
@property (nonatomic ,assign) double longitude;

/** 是否分享到故事 */
@property (nonatomic ,assign) bool isShareToStory;

@end

#pragma mark-
/// 分享结果回调
@interface ShareResult : NSObject

/** 结果状态 */
@property (nonatomic ,assign) SSDKResponseState state;

@end


NS_ASSUME_NONNULL_END
