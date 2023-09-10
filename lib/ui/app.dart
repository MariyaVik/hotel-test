import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_test/common/navigation/router.dart';

import '../common/di.dart';
import '../common/theme/light_theme.dart';
import '../cubits/booking_cubit.dart';
import '../cubits/hotel_cubit.dart';
import '../cubits/room_cubit.dart';

final dio = Dio();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HotelCubit(Locator.api)..loadHotel()),
        BlocProvider(create: (context) => RoomsCubit(Locator.api)..loadRooms()),
        BlocProvider(
            create: (context) => BookingCubit(Locator.api)..loadBooking()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: themeLight,
        routerConfig: router,
      ),
    );
  }
}
