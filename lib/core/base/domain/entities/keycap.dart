import 'package:floor/floor.dart';
import 'package:grab_bag/core/base/domain/entities/keycap_cat.dart';

@Entity(foreignKeys: [
  ForeignKey(
      childColumns: ['catId'],
      parentColumns: ['id'],
      entity: KeycapCat,
      onUpdate: ForeignKeyAction.cascade,
      onDelete: ForeignKeyAction.cascade)
])
class KeyCap {
  @primaryKey
  final String id;
  final String name;
  bool isFinish;
  final String catId;
  KeyCap(
      {required this.name,
      required this.isFinish,
      required this.catId,
      required this.id});
}
