import 'package:grab_bag/core/base/domain/entities/keycap.dart';
import 'package:grab_bag/core/base/domain/entities/keycap_set.dart';
import 'package:grab_bag/features/main_screen/domain/entities/keycap_cat_detail.dart';
import 'package:grab_bag/features/main_screen/domain/entities/keycap_set_detail.dart';

abstract class KeyCapSetRepo {
  Future<List<KeycapSet>> getAllSet(String groupId);
  Future<void> addNewKeycapSet(KeycapSet keycapSet);

  Future<KeyCapSetDetail> getKeyCapSetDetail(KeycapSet keycapSet);
  Future<void> updateKeyCapSetDetail(KeyCapSetDetail keyCapSetDetail);
  Future<void> addNewKeyCapCat(KeyCapCatDetail keyCapCatDetail);
  Future<void> deleteKeyCap(KeyCap keyCap);
}
