import 'package:flutter/material.dart';

import '../booking.dart';

class BookingState {
  final Booking booking;
  final bool isLoading;
  final int toutistsCount;
  final List<GlobalKey<FormState>> formKeys;
  final int totalPrice;

  const BookingState({
    this.booking = const Booking.empty(),
    this.isLoading = true,
    this.toutistsCount = 1,
    this.formKeys = const [],
    this.totalPrice = 0,
  });

  BookingState copyWith({
    Booking? booking,
    bool? isLoading,
    int? toutistsCount,
    List<GlobalKey<FormState>>? formKeys,
    int? totalPrice,
  }) {
    return BookingState(
      booking: booking ?? this.booking,
      isLoading: isLoading ?? this.isLoading,
      toutistsCount: toutistsCount ?? this.toutistsCount,
      formKeys: formKeys ?? this.formKeys,
      totalPrice: totalPrice ?? this.totalPrice,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BookingState &&
          runtimeType == other.runtimeType &&
          isLoading == other.isLoading &&
          booking == other.booking &&
          toutistsCount == other.toutistsCount;

  @override
  int get hashCode =>
      booking.hashCode ^ isLoading.hashCode ^ toutistsCount.hashCode;

  @override
  String toString() =>
      'BookingState{booking: $booking, isLoading: $isLoading, toutistsCount: $toutistsCount}';
}
