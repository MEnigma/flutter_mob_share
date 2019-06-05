/**
    Project         : flutter_mob_share
    Package name    : models
    Filename        : mkRegistConfig
    Date            : 2019/6/5 3:20 PM

    AUTHER : Mark
    EMAIL  : mkw666311@163.com
 */

import "package:flutter/material.dart";

/// 平台注册配置信息
class MKRegistConfig {
  MKRegistConfig(
      {this.platform,
      this.appkey,
      this.appid,
      this.appsecret,
      this.redirectUrl});

  /// 平台
  int platform;

  /// appkey
  String appkey;

  /// app id
  String appid;

  /// appsecret
  String appsecret;

  /// redirectUrl 回调地址,eg:微博
  String redirectUrl;

  Map<String, dynamic> toJson() {
    return {
      "platform": platform,
      "appkey": appkey,
      "appid": appid,
      "appsecret": appsecret,
      "redirectUrl": redirectUrl,
    };
  }
}

/// 注册回调结果
class MKRegistResult {
  MKRegistResult.fromJson(Map data) {
    this.succeed = data['succeed'];
    this.message = data['message'];
  }
  MKRegistResult.normalFail(){
    this.succeed = false;
  }

  Map<String, dynamic> toJson() {
    return {
      "succeed": succeed,
      "message": message,
    };
  }

  /// 是否成功
  bool succeed;

  /// 消息
  String message;

  @override
  String toString() {
    // TODO: implement toString
    return "[${this.runtimeType}] succeed : $succeed ,message : $message";
  }
}
