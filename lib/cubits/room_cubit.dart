import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/states/rooms_state.dart';
import '../services/api.dart';

class RoomsCubit extends Cubit<RoomsState> {
  final Api _roomsRepository;

  RoomsCubit(this._roomsRepository) : super(const RoomsState());

  void loadRooms() async {
    try {
      final hotelRooms = await _roomsRepository.getRoomsMap();
      emit(state.copyWith(rooms: hotelRooms.rooms, isLoading: false));
    } on Exception {
      emit(state.copyWith(rooms: const [], isLoading: false));
    }
  }
}
