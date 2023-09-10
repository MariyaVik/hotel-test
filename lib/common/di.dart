import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../services/api.dart';

abstract class Locator {
  static final _locator = GetIt.instance;

  static Api get api => _locator<Api>();

  static Future<void> init() async {
    final Dio dio = Dio();

    _locator.registerSingleton<Api>(
      Api(dio),
    );
  }
}
