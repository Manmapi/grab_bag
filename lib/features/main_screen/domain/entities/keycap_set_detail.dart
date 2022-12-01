import 'package:grab_bag/core/base/domain/entities/keycap_set.dart';
import 'package:grab_bag/features/main_screen/domain/entities/keycap_cat_detail.dart';

class KeyCapSetDetail {
  final KeycapSet keycapSet;
  final List<KeyCapCatDetail> keycapCatDetails;
  const KeyCapSetDetail(
      {required this.keycapCatDetails, required this.keycapSet});
}
