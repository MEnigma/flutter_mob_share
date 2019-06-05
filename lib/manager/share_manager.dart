/**
    Project         : flutter_mob_share
    Package name    : manager
    Filename        : ShareManager
    Date            : 2019/6/5 3:49 PM

    AUTHER : Mark
    EMAIL  : mkw666311@163.com
 */

import "package:flutter/material.dart";
import 'package:flutter/services.dart';

import '../defines/channel.dart';
import '../defines/enum.dart';

import '../models/share_config_mod.dart';


typedef ShareCallBackResult = Function(ShareResult result);

class Sharemanager{

  MethodChannel _shareChannel;

  Sharemanager(){
    _shareChannel = MethodChannel(CHANNEL_NAME_SHARE);
  }

  /// 分享到微信好友
  void shareToWechatSession(WechatSessionShare shareConfig , ShareCallBackResult result){
    _shareToPlatform("shareToWechatSession", shareConfig, result);
  }

  /// 分享到朋友圈
  void shareToWechatTimeline(WechatTimelineShare shareConfig, ShareCallBackResult result){
    _shareToPlatform("shareToWechatTimeline", shareConfig, result);
  }

  /// 分享到qq
  void shareToQQ(QQShare shareConfig,ShareCallBackResult result){
    _shareToPlatform("shareToQQ", shareConfig, result);
  }

  /// 分享到新浪微博
  void shareToSina(SinaWeiboShare shareConfig ,ShareCallBackResult,result){
    _shareToPlatform("shareToSina", shareConfig, result);
  }

  void _shareToPlatform(String methodName,BaseShareConfig config,ShareCallBackResult result){
    Future share_result = _shareChannel.invokeMethod(methodName,config.toJson());
    share_result.then((var res){
      if(res != null && result != null){
        result(ShareResult.fromJson(res));
      }else{
        if(result!=null){
          result(ShareResult.normalFail());
        }
      }
    });
  }

}
