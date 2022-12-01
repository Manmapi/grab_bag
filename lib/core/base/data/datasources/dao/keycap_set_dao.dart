import 'package:floor/floor.dart';
import 'package:grab_bag/core/base/domain/entities/keycap_set.dart';

@dao
abstract class KeycapSetDao {
  @insert
  Future<void> insertNewSet(KeycapSet keycapSet);

  @delete
  Future<void> deleteSet(KeycapSet keycapSet);
  @update
  Future<void> updateSet(KeycapSet keycapSet);
  @Query('SELECT * FROM KeycapSet WHERE groupId= :groupId')
  Future<List<KeycapSet>> getAllSetFromGroup(String groupId);
}
