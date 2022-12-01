import 'package:floor/floor.dart';
import 'package:grab_bag/core/base/domain/entities/keycap_cat.dart';

@dao
abstract class KeycapCatDao {
  @insert
  Future<void> insertNewCat(KeycapCat keycapCat);
  @delete
  Future<void> deleteCat(KeycapCat keycapCat);
  @update
  Future<void> updateCat(KeycapCat keycapCat);
  @Query('SELECT * FROM KeycapCat WHERE setId=:setId ORDER BY timeCreate DESC')
  Future<List<KeycapCat>> getAllCat(String setId);
}
