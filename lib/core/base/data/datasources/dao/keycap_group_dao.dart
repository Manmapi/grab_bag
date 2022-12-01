import 'package:floor/floor.dart';
import 'package:grab_bag/core/base/domain/entities/keycap_group.dart';

@dao
abstract class KeycapGroupDao {
  @insert
  Future<void> insertNewGroup(KeycapGroup keycapGroup);
  @delete
  Future<void> deleteGroup(KeycapGroup keycapGroup);
  @update
  Future<void> updateGroup(KeycapGroup keycapGroup);
  @Query('SELECT * FROM KeycapGroup ORDER BY timeCreate DESC')
  Future<List<KeycapGroup>> getAllGroup();

}
