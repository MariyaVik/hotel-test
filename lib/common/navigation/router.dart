import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../ui/booking_screen/booking_page.dart';
import '../../ui/hotel_screen/hotel_page.dart';
import '../../ui/paid_screen/paid_page.dart';
import '../../ui/room_screnn/room_page.dart';
import 'route_name.dart';

final GoRouter router = GoRouter(
  initialLocation: RouteName.home,
  routes: <RouteBase>[
    GoRoute(
      name: RouteName.home,
      path: RouteName.home,
      builder: (BuildContext context, GoRouterState state) {
        return const HotelPage();
      },
    ),
    GoRoute(
      name: RouteName.room,
      path: '${RouteName.home}${RouteName.room}',
      builder: (BuildContext context, GoRouterState state) {
        return const RoomPage();
      },
    ),
    GoRoute(
      name: RouteName.booking,
      path: '${RouteName.home}${RouteName.room}/${RouteName.booking}',
      builder: (BuildContext context, GoRouterState state) {
        return const BookingPage();
      },
    ),
    GoRoute(
      name: RouteName.paid,
      path:
          '${RouteName.home}${RouteName.room}/${RouteName.booking}/${RouteName.paid}',
      builder: (BuildContext context, GoRouterState state) {
        return const PaidPage();
      },
    ),
  ],
);
