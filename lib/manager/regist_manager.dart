/**
    Project         : flutter_mob_share
    Package name    : manager
    Filename        : RegistManager
    Date            : 2019/6/5 3:08 PM

    AUTHER : Mark
    EMAIL  : mkw666311@163.com
 */

import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import '../defines/channel.dart';
import "../models/regist_config_mod.dart";
import '../defines/enum.dart';

typedef RegistResult = Function(MKRegistResult result);

class Registmanager {

  MethodChannel _registChannel;

  Registmanager(){
    _registChannel = MethodChannel(CHANNEL_NAME_REGIST);
  }

  /// 注册微信
  void registWechat(MKRegistConfig config,RegistResult result){
    _registPlatform(SSDPlatformType().SSDKPlatformTypeWechat, config, result);
  }

  /// 注册qq
  void registQQ(MKRegistConfig config ,RegistResult result){
    _registPlatform(SSDPlatformType().SSDKPlatformTypeQQ, config, result);
  }

  /// 注册新浪微博
  void registSina(MKRegistConfig config, RegistResult result){
    _registPlatform(SSDPlatformType().SSDKPlatformTypeSinaWeibo, config, result);
  }

  void _registPlatform(int platform,MKRegistConfig config,RegistResult result){
    if(config != null){
      config.platform = platform;
    }else{
      if(result != null){
        result(MKRegistResult.normalFail());
      }
    }
    Future result_value = _registChannel.invokeMethod("regist",config.toJson());
    result_value.then((var result_value){
      MKRegistResult registResult = MKRegistResult.fromJson(result_value);
      if(result != null)result(registResult);
    });
  }

}
