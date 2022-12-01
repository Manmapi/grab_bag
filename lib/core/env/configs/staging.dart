import '../config.dart';

class StagingConfig implements Config {
  @override
  String get apiHost => 'https://api.hatien.zien.vn/api';

  @override
  bool get debug => true;
}
