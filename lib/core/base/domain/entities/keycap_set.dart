import 'package:floor/floor.dart';
import 'package:grab_bag/core/base/domain/entities/keycap_group.dart';

@Entity(foreignKeys: [
  ForeignKey(
      childColumns: ['groupId'],
      parentColumns: ['id'],
      entity: KeycapGroup,
      onUpdate: ForeignKeyAction.cascade,
      onDelete: ForeignKeyAction.cascade)
])
class KeycapSet {
  @primaryKey
  final String id;
  final String name;
  bool isComplete;
  final String? description;
  final String? imagePath;
  final String groupId;
  KeycapSet(
      {required this.name,
      required this.isComplete,
      required this.groupId,
      this.imagePath,
      this.description,
      required this.id});
}
