import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/booking.dart';
import '../models/states/booking_state.dart';
import '../services/api.dart';

class BookingCubit extends Cubit<BookingState> {
  final Api _bookingRepository;

  BookingCubit(this._bookingRepository) : super(const BookingState());

  void loadBooking() async {
    try {
      final booking = await _bookingRepository.getBooking();
      emit(state.copyWith(booking: booking, isLoading: false));
    } on Exception {
      emit(state.copyWith(booking: const Booking.empty(), isLoading: false));
    }
  }
}
