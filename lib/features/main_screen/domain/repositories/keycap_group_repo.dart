import 'package:grab_bag/core/base/domain/entities/keycap_group.dart';

abstract class KeycapGroupRepo {
  Future<List<KeycapGroup>> getAllGroup();
  Future<void> addNewKeycapGroup(KeycapGroup keycapGroup);
}
