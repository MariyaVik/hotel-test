import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../common/navigation/route_name.dart';
import '../../cubits/booking_cubit.dart';
import '../../models/states/booking_state.dart';
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

class BookingPage extends StatelessWidget {
  const BookingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text('Бронирование'),
      ),
      body: BlocBuilder<BookingCubit, BookingState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView(
            children: [
              const SizedBox(height: 8),
              HotelInfoWidget(booking: state.booking),
              const SizedBox(height: 8),
              TourInfo(booking: state.booking),
              const SizedBox(height: 8),
              const BuyerInfo(),
              const SizedBox(height: 8),
              const TouristCard(
                expand: true,
                touristNumber: 1,
              ),
              const SizedBox(height: 8),
              const AddTourist(),
              const SizedBox(height: 8),
              Prices(bookingInfo: state.booking),
              const SizedBox(height: 8),
            ],
          );
        },
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
          child: const Text('Оплатить'),
        ),
      ),
    );
  }
}
