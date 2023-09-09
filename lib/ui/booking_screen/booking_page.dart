import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:hotel_test/main.dart';
import 'package:hotel_test/models/booking.dart';
import '../../common/navigation/route_name.dart';
import 'widgets/add_tourist.dart';
import 'widgets/buyer_info.dart';
import 'widgets/hotel_info_widget.dart';
import 'widgets/prices.dart';
import 'widgets/tour_info.dart';
import 'widgets/tourist_card.dart';

final List<GlobalKey<FormState>> formKeys = [
  GlobalKey<FormState>(),
  GlobalKey<FormState>(),
];

class BookingPage extends StatefulWidget {
  const BookingPage({super.key});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  Booking? bookingInfo;
  bool isCollapse = true;

  @override
  void initState() {
    super.initState();
    client.getBooking().then((it) {
      bookingInfo = it;
      logger.i(bookingInfo);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text('Бронирование'),
      ),
      body: bookingInfo == null
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              children: [
                const SizedBox(height: 8),
                HotelInfoWidget(booking: bookingInfo!),
                const SizedBox(height: 8),
                TourInfo(booking: bookingInfo!),
                const SizedBox(height: 8),
                BuyerInfo(),
                const SizedBox(height: 8),
                const TouristCard(
                  expand: true,
                  touristNumber: 1,
                ),
                const SizedBox(height: 8),
                AddTourist(),
                const SizedBox(height: 8),
                Prices(bookingInfo: bookingInfo!),
                const SizedBox(height: 8),
              ],
            ),
      bottomNavigationBar: BottomAppBar(
        child: ElevatedButton(
          onPressed: () {
            bool error = false;
            for (int i = 0; i < formKeys.length; i++) {
              if (formKeys[i].currentState!.validate()) {
                continue;
              } else {
                error = true;
              }
            }
            if (!error) {
              context.pushNamed(RouteName.paid);
            }
          },
          child: Text('Оплатить'),
        ),
      ),
    );
  }
}
