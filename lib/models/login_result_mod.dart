/**
    Project         : flutter_mob_share
    Package name    : models
    Filename        : mkLoginResult
    Date            : 2019/6/5 4:07 PM

    AUTHER : Mark
    EMAIL  : mkw666311@163.com
 */

import "package:flutter/material.dart";
import '../defines/enum.dart';

class MKLoginResult{

  MKLoginResult.fromJson(Map data){
    if(data == null){
     print("[Share sdk mention]<${this.runtimeType}> input data is null");
    }
    state = int.parse(data['state'].toString());
    platformType = int.parse(data['platformType'].toString());
    uid =  data['uid'];
    nickname = data['nickname'];
    icon = data['icon'];
    gender = data['gender'];
  }

  MKLoginResult();

  /// 状态(SSDResponseState)
  int state;

  /// 平台类型 (SSDPlatformType)
  int platformType;

  /// uid
  String uid;

  /// nickname
  String nickname;

  /// 头像
  String icon;

  /// 性别,0-男,1-女,2-位置
  int gender;

}
