import 'package:floor/floor.dart';
import 'package:grab_bag/core/base/domain/entities/keycap.dart';

@dao
abstract class KeycapDao {
  @insert
  Future<void> insertNewKeyCap(KeyCap keyCap);
  @insert
  Future<void> insertNewKeyCaps(List<KeyCap> keyCaps);
  @delete
  Future<void> deleteKeyCap(KeyCap keyCap);
  @update
  Future<void> updateKeyCap(KeyCap keyCap);
  @update
  Future<void> updateKeyCaps(List<KeyCap> keycaps);
  @Query('SELECT * FROM KeyCap WHERE catID = :catID')
  Future<List<KeyCap>> getAllKeyCap(String catID);
}
