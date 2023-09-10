import '../hotel.dart';

class HotelState {
  final Hotel hotel;
  final bool isLoading;

  const HotelState({
    this.hotel = const Hotel.empty(),
    this.isLoading = true,
  });

  HotelState copyWith({
    Hotel? hotel,
    bool? isLoading,
  }) {
    return HotelState(
      hotel: hotel ?? this.hotel,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HotelState &&
          runtimeType == other.runtimeType &&
          isLoading == other.isLoading &&
          hotel == other.hotel;

  @override
  int get hashCode => hotel.hashCode ^ isLoading.hashCode;

  @override
  String toString() => 'SpeakersState{speakers: $hotel, isLoading: $isLoading}';
}
