import 'package:grab_bag/core/base/domain/entities/keycap.dart';
import 'package:grab_bag/core/base/domain/entities/keycap_cat.dart';
import 'package:grab_bag/core/base/domain/entities/keycap_set.dart';
import 'package:grab_bag/core/constants.dart';
import 'package:grab_bag/features/main_screen/data/datasources/local_data_source.dart';
import 'package:grab_bag/features/main_screen/domain/entities/keycap_cat_detail.dart';
import 'package:grab_bag/features/main_screen/domain/entities/keycap_set_detail.dart';
import 'package:grab_bag/features/main_screen/domain/repositories/keycap_set_repo.dart';
import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';

@Injectable(as: KeyCapSetRepo)
class KeyCapSetRepoImp extends KeyCapSetRepo {
  final LocalDataSource localDataSource;
  KeyCapSetRepoImp(this.localDataSource);
  @override
  Future<List<KeycapSet>> getAllSet(String groupId) async {
    return await localDataSource.database.keycapSetDao
        .getAllSetFromGroup(groupId);
  }

  @override
  Future<void> addNewKeycapSet(KeycapSet keycapSet) async {
    await localDataSource.database.keycapSetDao.insertNewSet(keycapSet);
    final alpha = KeycapCat(
        id: const Uuid().v4(),
        name: 'Alpha',
        setId: keycapSet.id,
        timeCreate: DateTime.now().millisecondsSinceEpoch);
    await localDataSource.database.keycapCatDao.insertNewCat(alpha);
    final List<KeyCap> keycaps = alphaBaseList
        .map((e) => KeyCap(
            id: const Uuid().v4(), name: e, isFinish: false, catId: alpha.id))
        .toList();
    await localDataSource.database.keycapDao.insertNewKeyCaps(keycaps);
  }

  @override
  Future<KeyCapSetDetail> getKeyCapSetDetail(KeycapSet keycapSet) async {
    final List<KeycapCat> keycapCats =
        await localDataSource.database.keycapCatDao.getAllCat(keycapSet.id);

    final List<KeyCapCatDetail> keyCapCatDetails = [];
    for (KeycapCat keycapCat in keycapCats) {
      final List<KeyCap> keycaps =
          await localDataSource.database.keycapDao.getAllKeyCap(keycapCat.id);
      final List<KeyCap> totalComplete = keycaps.where((element) {
        return element.isFinish == true;
      }).toList();
      keyCapCatDetails.add(KeyCapCatDetail(
          keycapCat: keycapCat,
          keycaps: keycaps,
          total: keycaps.length,
          totalComplete: totalComplete.length));
    }
    final KeyCapSetDetail keyCapSetDetail = KeyCapSetDetail(
        keycapCatDetails: keyCapCatDetails, keycapSet: keycapSet);
    return keyCapSetDetail;
  }

  @override
  Future<void> updateKeyCapSetDetail(KeyCapSetDetail keyCapSetDetail) async {
    for (KeyCapCatDetail keyCapCatDetail in keyCapSetDetail.keycapCatDetails) {
      await localDataSource.database.keycapCatDao
          .updateCat(keyCapCatDetail.keycapCat);
      await localDataSource.database.keycapDao
          .updateKeyCaps(keyCapCatDetail.keycaps);
    }
  }

  @override
  Future<void> addNewKeyCapCat(KeyCapCatDetail keyCapCatDetail) async {
    await localDataSource.database.keycapCatDao
        .insertNewCat(keyCapCatDetail.keycapCat);
    if (keyCapCatDetail.keycaps.isNotEmpty) {
      await localDataSource.database.keycapDao
          .insertNewKeyCaps(keyCapCatDetail.keycaps);
    }
  }

  @override
  Future<void> deleteKeyCap(KeyCap keyCap) async {
    await localDataSource.database.keycapDao.deleteKeyCap(keyCap);
  }
}
