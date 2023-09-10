import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/hotel.dart';
import '../models/states/hotel_state.dart';
import '../services/api.dart';

class HotelCubit extends Cubit<HotelState> {
  final Api _hotelRepository;

  HotelCubit(this._hotelRepository) : super(const HotelState());

  void loadHotel() async {
    try {
      final hotel = await _hotelRepository.getHotel();
      emit(state.copyWith(hotel: hotel, isLoading: false));
    } on Exception {
      emit(state.copyWith(hotel: const Hotel.empty(), isLoading: false));
    }
  }
}
