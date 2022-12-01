import 'package:grab_bag/core/base/domain/entities/keycap.dart';
import 'package:grab_bag/core/base/domain/entities/keycap_cat.dart';

class KeyCapCatDetail {
  KeycapCat keycapCat;
  final List<KeyCap> keycaps;
  int total;
  int totalComplete;
  KeyCapCatDetail(
      {required this.keycapCat,
      required this.keycaps,
      required this.total,
      required this.totalComplete});
}
