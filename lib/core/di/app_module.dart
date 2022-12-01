import 'dart:io';

import 'package:fluro/fluro.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class AppModule {
  @singleton
  FluroRouter get router => FluroRouter();

  @preResolve
  @singleton
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  @preResolve
  @lazySingleton
  Future<Directory> get documentDirectory => getApplicationDocumentsDirectory();

  @lazySingleton
  ImagePicker get imagePicker => ImagePicker();

  @lazySingleton
  ImageCropper get imageCropper => ImageCropper();
}
