import 'package:grab_bag/core/base/domain/entities/keycap_group.dart';
import 'package:grab_bag/features/main_screen/data/datasources/local_data_source.dart';
import 'package:grab_bag/features/main_screen/domain/repositories/keycap_group_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: KeycapGroupRepo)
class KeycapGroupRepoImp extends KeycapGroupRepo {
  final LocalDataSource localDataSource;
  KeycapGroupRepoImp(this.localDataSource);
  @override
  Future<List<KeycapGroup>> getAllGroup() async {
    return await localDataSource.database.keycapGroupDao.getAllGroup();
  }

  @override
  Future<void> addNewKeycapGroup(KeycapGroup keycapGroup) async {
    await localDataSource.database.keycapGroupDao.insertNewGroup(keycapGroup);
  }
}
