import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../common/navigation/route_name.dart';
import '../../common/utils.dart';
import '../../cubits/booking_cubit.dart';
import '../../models/states/booking_state.dart';
import 'widgets/add_tourist.dart';
import 'widgets/buyer_info.dart';
import 'widgets/hotel_info_widget.dart';
import 'widgets/prices.dart';
import 'widgets/tour_info.dart';
import 'widgets/tourist_card.dart';

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
              ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => TouristCard(
                        expand: true,
                        touristNumber: index + 1,
                      ),
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 8),
                  itemCount: state.toutistsCount),
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
            final formKeys = BlocProvider.of<BookingCubit>(context).formKeys;
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
          child: BlocBuilder<BookingCubit, BookingState>(
            builder: (context, state) {
              return Text('Оплатить ${priceFormat(state.totalPrice)} ₽');
            },
          ),
        ),
      ),
    );
  }
}
