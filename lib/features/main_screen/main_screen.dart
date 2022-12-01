import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';

import 'package:get_it/get_it.dart';
import 'package:grab_bag/core/base/domain/entities/keycap_group.dart';
import 'package:grab_bag/core/base/domain/entities/keycap_set.dart';
import 'package:grab_bag/features/main_screen/presentation/pages/group_detail.dart';
import 'package:grab_bag/features/main_screen/presentation/pages/main_screen.dart';
import 'package:grab_bag/features/main_screen/presentation/pages/set_detail.dart';

Future register() async {
  registerRoutes();
}

void registerRoutes() {
  FluroRouter router = GetIt.I.get();
  router
    ..define('/home', handler: Handler(handlerFunc: (context, params) {
      return const MainScreen();
    }))
    ..define('/home/group',
        handler: Handler(handlerFunc: (BuildContext? context, params) {
      final keycapGroup = context!.settings!.arguments! as KeycapGroup;
      return GroupDetail(
        keycapGroup: keycapGroup,
      );
    }))
    ..define('/home/group/set',
        handler: Handler(handlerFunc: (BuildContext? context, params) {
      final keycapSet = context!.settings!.arguments! as KeycapSet;
      return SetDetail(
        keycapSet: keycapSet,
      );
    }));
}
