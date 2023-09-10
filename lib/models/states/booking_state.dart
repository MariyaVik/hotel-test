import '../booking.dart';

class BookingState {
  final Booking booking;
  final bool isLoading;

  const BookingState({
    this.booking = const Booking.empty(),
    this.isLoading = true,
  });

  BookingState copyWith({
    Booking? booking,
    bool? isLoading,
  }) {
    return BookingState(
      booking: booking ?? this.booking,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BookingState &&
          runtimeType == other.runtimeType &&
          isLoading == other.isLoading &&
          booking == other.booking;

  @override
  int get hashCode => booking.hashCode ^ isLoading.hashCode;

  @override
  String toString() =>
      'SpeakersState{speakers: $booking, isLoading: $isLoading}';
}
