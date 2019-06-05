/**
    Project         : flutter_mob_share
    Package name    : defines
    Filename        : enum
    Date            : 2019/6/5 2:52 PM

    AUTHER : Mark
    EMAIL  : mkw666311@163.com
 */

import "package:flutter/material.dart";

class SSDContentType {
  ///  自动适配类型，视传入的参数来决定
  int get SSDKContentTypeAuto => 0;

  /// 文本
  int get SSDKContentTypeText => 1;

  /// 图片
  int get SSDKContentTypeImage => 2;

  /// 网页
  int get SSDKContentTypeWebPage => 3;

  /// 应用
  int get SSDKContentTypeApp => 4;

  /// 音频
  int get SSDKContentTypeAudio => 5;

  /// 视频
  int get SSDKContentTypeVideo => 6;

  /// 文件类型(暂时仅微信可用)
  int get SSDKContentTypeFile => 7;
}

class SSDPlatformType {
  /// 微信好友
  int get SSDKPlatformSubTypeWechatSession => 22;

  /// 微信朋友圈
  int get SSDKPlatformSubTypeWechatTimeline => 23;

  /// 微信收藏
  int get SSDKPlatformSubTypeWechatFav => 37;

  /// 微信平台,
  int get SSDKPlatformTypeWechat => 997;

  /// QQ平台
  int get SSDKPlatformTypeQQ => 998;

  /// qq空间
  int get SSDKPlatformSubTypeQZone => 6;

  /// qq好友
  int get SSDKPlatformSubTypeQQFriend => 24;

  /// 新浪微博
  int get SSDKPlatformTypeSinaWeibo => 1;
}

/// 分享回调结果
class SSDResponseState {
  /// 开始
  int get SSDKResponseStateBegin => 0;

  /// 成功
  int get SSDKResponseStateSuccess => 1;

  /// 失败
  int get SSDKResponseStateFail => 2;

  /// 取消
  int get SSDKResponseStateCancel => 3;

  /// 上传
  int get SSDKResponseStateUpload => 4;
}
