import 'package:floor/floor.dart';

@entity
class KeycapGroup {
  @primaryKey
  final String id;
  final String name;
  final String? description;
  int total;
  int totalComplete;
  final int timeCreate;
  KeycapGroup(
      {required this.name,
      required this.description,
      required this.total,
      required this.totalComplete,
      required this.timeCreate,
      required this.id});
}
