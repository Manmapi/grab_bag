import '../config.dart';

class DevConfig implements Config {
  @override
  String get apiHost => 'https://api.hatien.zien.vn/api';

  @override
  bool get debug => true;
}
