import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import 'common/di.dart';
import 'ui/app.dart';

final logger = Logger();

Future<void> main() async {
  await Locator.init();
  runApp(const MyApp());
}
