import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

extension BlocExtension on Bloc {
  T find<T extends Object>({
    String? instanceName,
    dynamic param1,
    dynamic param2,
  }) {
    return GetIt.I.get<T>();
  }
}
