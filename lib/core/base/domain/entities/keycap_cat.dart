import 'package:floor/floor.dart';
import 'package:grab_bag/core/base/domain/entities/keycap_set.dart';

@Entity(foreignKeys: [
  ForeignKey(
      childColumns: ['setId'],
      parentColumns: ['id'],
      entity: KeycapSet,
      onUpdate: ForeignKeyAction.cascade,
      onDelete: ForeignKeyAction.cascade)
])
class KeycapCat {
  @primaryKey
  final String id;
  final String name;
  final int timeCreate;
  final String setId;
  KeycapCat(
      {required this.name,
      required this.setId,
      required this.timeCreate,
      required this.id});
}
