/**
    Project         : flutter_mob_share
    Package name    : manager
    Filename        : LoginManager
    Date            : 2019/6/5 4:14 PM

    AUTHER : Mark
    EMAIL  : mkw666311@163.com
 */

import "package:flutter/material.dart";
import 'package:flutter/services.dart';

import '../defines/channel.dart';
import '../defines/enum.dart';

import '../models/login_result_mod.dart';


typedef LoginCallbackResponse = Function(MKLoginResult loginResponse);

class Loginmanager{
  MethodChannel _loginChannel;
  Loginmanager(){
    _loginChannel = MethodChannel(CHANNEL_NAME_LOGIN_AUTH);
  }
  /// 微信登录
  void loginToWechat(LoginCallbackResponse response){
    _loginToPlatform("loginToWechat",response);
  }

  /// qq登录
  void loginToQQ(LoginCallbackResponse response){
    _loginToPlatform("loginToQQ", response);
  }

  /// 微博登录
  void loginToSina(LoginCallbackResponse response){
    _loginToPlatform("loginToSina", response);
  }

  void _loginToPlatform(String methodName,LoginCallbackResponse response){
    Future log_res = _loginChannel.invokeMethod(methodName);
    log_res.then((var res){
      if(res != null){
        response(MKLoginResult.fromJson(res));
      }else{
        response(null);
      }
    });
  }

}
