import '../config.dart';

class ProdConfig implements Config {
  @override
  String get apiHost => 'https://api.hatien.zien.vn/api';

  @override
  bool get debug => false;
}
