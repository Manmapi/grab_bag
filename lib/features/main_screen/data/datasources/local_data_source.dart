import 'package:grab_bag/core/base/base.dart';
import 'package:injectable/injectable.dart';

@injectable
class LocalDataSource extends BaseLocalDataSource {
  LocalDataSource(super.database, super.prefs);
}
