/**
    Project         : flutter_mob_share
    Package name    : models
    Filename        : mkShareConfig
    Date            : 2019/6/5 2:35 PM

    AUTHER : Mark
    EMAIL  : mkw666311@163.com
 */

import "package:flutter/material.dart";
import "../defines/enum.dart";

/// 分享基类
class BaseShareConfig {
  BaseShareConfig(
      {this.contentText,
      this.title,
      this.url,
      this.thumbnailPath,
      this.imagePath,
      this.musicPath,
      this.vedioPath,
      this.filePath,
      this.contentType,
      this.platformType});

  /// 文本内容
  String contentText;

  /// 标题
  String title;

  /// url
  String url;

  /// 缩略图本地地址
  String thumbnailPath;

  /// 原图本地地址
  String imagePath;

  /// 音乐文件地址
  String musicPath;

  /// 视频文件地址
  String vedioPath;

  /// 文件路径
  String filePath;

  /// 分享的内容类型(SSDcontentType)
  int contentType;

  /// 分享的平台(SSDPlatformType)
  int platformType;

  Map<String, dynamic> toJson() {
    return {
      "contentText": contentText,
      "title": title,
      "url": url,
      "thumbnailPath": thumbnailPath,
      "imagePath": imagePath,
      "musicPath": musicPath,
      "vedioPath": vedioPath,
      "filePath": filePath,
      "contentType": contentType,
      "platformType": platformType,
    };
  }
}

/// 微信朋友分享
class WechatSessionShare extends BaseShareConfig {
  WechatSessionShare({
    this.extinfo,
    this.emoticonPath,
    String contentText,
    String title,
    String url,
    String thumbnailPath,
    String imagePath,
    String musicPath,
    String vedioPath,
    String filePath,
    int contentType,
    int platformType,
  }) : super(
          contentText: contentText,
          title: title,
          url: url,
          thumbnailPath: thumbnailPath,
          imagePath: imagePath,
          musicPath: musicPath,
          vedioPath: vedioPath,
          filePath: filePath,
          contentType: contentType,
          platformType: platformType,
        );

  /// ext
  String extinfo;

  /// emoticonData
  String emoticonPath;

  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    return super.toJson()
      ..addAll({
        "emoticonPath": emoticonPath,
        "extinfo": extinfo,
      });
  }
}

/// 朋友圈分享
class WechatTimelineShare extends WechatSessionShare {
  WechatTimelineShare({
    String contentText,
    String title,
    String url,
    String thumbnailPath,
    String imagePath,
    String musicPath,
    String vedioPath,
    String filePath,
    int contentType,
    int platformType,
  }) : super(
    contentText: contentText,
    title: title,
    url: url,
    thumbnailPath: thumbnailPath,
    imagePath: imagePath,
    musicPath: musicPath,
    vedioPath: vedioPath,
    filePath: filePath,
    contentType: contentType,
    platformType: platformType,
  );

}

/// qq分享
class QQShare extends BaseShareConfig {

  QQShare({
    this.audioPath,
    String contentText,
    String title,
    String url,
    String thumbnailPath,
    String imagePath,
    String musicPath,
    String vedioPath,
    String filePath,
    int contentType,
    int platformType,
  }) : super(
    contentText: contentText,
    title: title,
    url: url,
    thumbnailPath: thumbnailPath,
    imagePath: imagePath,
    musicPath: musicPath,
    vedioPath: vedioPath,
    filePath: filePath,
    contentType: contentType,
    platformType: platformType,
  );

  /// 音频本地路径
  String audioPath;

  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    return super.toJson()..addAll({"audioPath": audioPath});
  }
}

/// 新浪微博分享
class SinaWeiboShare extends BaseShareConfig {
  SinaWeiboShare({
    this.images,
    this.latitude,
    this.longitude,
    this.isShareToStory,
    String contentText,
    String title,
    String url,
    String thumbnailPath,
    String imagePath,
    String musicPath,
    String vedioPath,
    String filePath,
    int contentType,
    int platformType,
  }) : super(
    contentText: contentText,
    title: title,
    url: url,
    thumbnailPath: thumbnailPath,
    imagePath: imagePath,
    musicPath: musicPath,
    vedioPath: vedioPath,
    filePath: filePath,
    contentType: contentType,
    platformType: platformType,
  );

  /// 图片集合  传入参数可以为单张图片信息，也可以为一个NSArray，数组元素可以为UIImage、String（图片路径）、NSURL（图片路径）、SSDKImage。如extends @"httpextends//www.mob.com/images/logo_black.png" 或 @[@"httpextends//www.mob.com/images/logo_black.png"] */
  List<String> images;

  /// latitude
  double latitude;

  /// longitude
  double longitude;

  ///是否分享到故事
  bool isShareToStory;

  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    return super.toJson()
      ..addAll({
        "images": images,
        "latitude": latitude,
        "longitude": longitude,
        "isShareToStory": isShareToStory,
      });
  }
}

/// 分享结果回调
class ShareResult {
  ShareResult.fromJson(Map data) {
    this.state = int.parse(data['state'].toString());
  }

  ShareResult.normalFail() {
    this.state = SSDResponseState().SSDKResponseStateFail;
  }

  /// 结果状态
  int state;
}
