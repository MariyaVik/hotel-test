import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/booking.dart';
import '../models/states/booking_state.dart';
import '../services/api.dart';

class BookingCubit extends Cubit<BookingState> {
  final Api _bookingRepository;

  BookingCubit(this._bookingRepository) : super(const BookingState());

  List<GlobalKey<FormState>> get formKeys => state.formKeys;

  int get totalPrice => state.totalPrice;

  void loadBooking() async {
    try {
      final booking = await _bookingRepository.getBooking();
      emit(state.copyWith(
          booking: booking,
          isLoading: false,
          formKeys: [GlobalKey<FormState>(), GlobalKey<FormState>()],
          totalPrice:
              booking.tourPrice + booking.fuelCharge + booking.serviceCharge));
    } on Exception {
      emit(state.copyWith(booking: const Booking.empty(), isLoading: false));
    }
  }

  void addToutist() {
    int count = state.toutistsCount + 1;
    if (count > 10) {
      emit(state);
    } else {
      List<GlobalKey<FormState>> keys = [
        ...state.formKeys,
        GlobalKey<FormState>()
      ];
      emit(state.copyWith(toutistsCount: count, formKeys: keys));
    }
  }
}
