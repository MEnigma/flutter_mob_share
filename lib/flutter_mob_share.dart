import 'dart:async';

import 'package:flutter/services.dart';

import 'manager/login_manager.dart';
import 'manager/regist_manager.dart';
import 'manager/share_manager.dart';

export 'defines/channel.dart';
export 'defines/enum.dart';
export 'models/login_result_mod.dart';
export 'models/regist_config_mod.dart';
export 'models/share_config_mod.dart';

class FlutterMobShare {

  final Loginmanager _loginManager = Loginmanager();
  final Registmanager _registManager = Registmanager();
  final Sharemanager _shareManager = Sharemanager();

  Loginmanager get loginManager => _loginManager;

  Registmanager get registManager => _registManager;

  Sharemanager get shareManager => _shareManager;

}
