import 'package:flutter/material.dart';
import 'package:hotel_test/common/navigation/router.dart';

import '../common/theme/light_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: themeLight,
      routerConfig: router,
    );
  }
}
