import 'package:flutter/material.dart';

import '../common/theme/light_theme.dart';
import 'hotel_screen/hotel_page.dart';
import 'room_screnn/room_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: themeLight,
      home: const RoomPage(),
    );
  }
}
