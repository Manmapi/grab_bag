import 'package:chopper/chopper.dart';

abstract class BaseRemoteDataSource {
  final ChopperClient client;

  BaseRemoteDataSource(
    this.client,
  );
}
