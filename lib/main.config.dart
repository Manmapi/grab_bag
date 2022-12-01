// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:io' as _i4;

import 'package:fluro/fluro.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:image_cropper/image_cropper.dart' as _i6;
import 'package:image_picker/image_picker.dart' as _i7;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i8;

import 'core/base/base.dart' as _i10;
import 'core/base/data/datasources/app_database.dart' as _i3;
import 'core/di/app_module.dart' as _i16;
import 'features/main_screen/data/datasources/local_data_source.dart' as _i9;
import 'features/main_screen/data/repositories/keycap_group_repo_imp.dart'
    as _i14;
import 'features/main_screen/data/repositories/keycap_set_repo_imp.dart'
    as _i12;
import 'features/main_screen/domain/repositories/keycap_group_repo.dart'
    as _i13;
import 'features/main_screen/domain/repositories/keycap_set_repo.dart' as _i11;
import 'features/main_screen/presentation/bloc/main_screen_bloc.dart' as _i15;

const String _prod = 'prod';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final appModule = _$AppModule();
  await gh.singletonAsync<_i3.AppDatabase>(
    () => _i3.AppDatabase.create(),
    registerFor: {_prod},
    preResolve: true,
  );
  await gh.lazySingletonAsync<_i4.Directory>(
    () => appModule.documentDirectory,
    preResolve: true,
  );
  gh.singleton<_i5.FluroRouter>(appModule.router);
  gh.lazySingleton<_i6.ImageCropper>(() => appModule.imageCropper);
  gh.lazySingleton<_i7.ImagePicker>(() => appModule.imagePicker);
  await gh.singletonAsync<_i8.SharedPreferences>(
    () => appModule.prefs,
    preResolve: true,
  );
  gh.factory<_i9.LocalDataSource>(() => _i9.LocalDataSource(
        get<_i10.AppDatabase>(),
        get<_i8.SharedPreferences>(),
      ));
  gh.factory<_i11.KeyCapSetRepo>(
      () => _i12.KeyCapSetRepoImp(get<_i9.LocalDataSource>()));
  gh.factory<_i13.KeycapGroupRepo>(
      () => _i14.KeycapGroupRepoImp(get<_i9.LocalDataSource>()));
  gh.singleton<_i15.MainScreenBloc>(_i15.MainScreenBloc(
    get<_i13.KeycapGroupRepo>(),
    get<_i11.KeyCapSetRepo>(),
  ));
  return get;
}

class _$AppModule extends _i16.AppModule {}
