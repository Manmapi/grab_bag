import 'dart:async';
import 'package:floor/floor.dart';
import 'package:grab_bag/core/base/data/datasources/dao/keycap_cat_dao.dart';
import 'package:grab_bag/core/base/data/datasources/dao/keycap_dao.dart';
import 'package:grab_bag/core/base/data/datasources/dao/keycap_group_dao.dart';
import 'package:grab_bag/core/base/data/datasources/dao/keycap_set_dao.dart';
import 'package:grab_bag/core/base/domain/entities/keycap.dart';
import 'package:grab_bag/core/base/domain/entities/keycap_cat.dart';
import 'package:grab_bag/core/base/domain/entities/keycap_group.dart';
import 'package:grab_bag/core/base/domain/entities/keycap_set.dart';
import 'package:grab_bag/core/env/env.dart';

import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'app_database.g.dart';

@prod
@preResolve
@singleton
@Database(version: 1, entities: [KeycapSet, KeycapGroup, KeyCap, KeycapCat])
abstract class AppDatabase extends FloorDatabase {
  KeycapGroupDao get keycapGroupDao;
  KeycapSetDao get keycapSetDao;
  KeycapCatDao get keycapCatDao;
  KeycapDao get keycapDao;
  @factoryMethod
  static Future<AppDatabase> create() async {
    return await $FloorAppDatabase.databaseBuilder(Env.config.apiHost).build();
  }
}
