import 'package:shared_preferences/shared_preferences.dart';

import 'app_database.dart';

abstract class BaseLocalDataSource {
  final AppDatabase database;
  final SharedPreferences prefs;

  BaseLocalDataSource(this.database, this.prefs);
}
