import 'package:grab_bag/core/env/config.dart';

import 'configs/dev.dart';
import 'configs/staging.dart';
import 'configs/prod.dart';

class Env {
  Env._privateConstructor();
  static late Config config;

  static setMode(EnvMode mode) {
    config = _getConfig(mode);
  }

  static Config _getConfig(EnvMode mode) {
    switch (mode) {
      case EnvMode.prod:
        return ProdConfig();
      case EnvMode.staging:
        return StagingConfig();
      default:
        return DevConfig();
    }
  }
}

// Environment types
enum EnvMode { dev, staging, prod }
