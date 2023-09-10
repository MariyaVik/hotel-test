// ignore_for_file: depend_on_referenced_packages

import 'package:json_annotation/json_annotation.dart';

part 'booking.g.dart';

@JsonSerializable()
class Booking {
  final int id;
  @JsonKey(name: 'hotel_name')
  final String hotelName;
  @JsonKey(name: 'hotel_adress')
  final String hotelAdress;
  @JsonKey(name: 'horating')
  final int rating;
  @JsonKey(name: 'rating_name')
  final String ratingName;
  final String departure;
  @JsonKey(name: 'arrival_country')
  final String arrivalCountry;
  @JsonKey(name: 'tour_date_start')
  final String tourDateStart;
  @JsonKey(name: 'tour_date_stop')
  final String tourDateStop;
  @JsonKey(name: 'number_of_nights')
  final int numberOfNights;
  final String room;
  final String nutrition;
  @JsonKey(name: 'tour_price')
  final int tourPrice;
  @JsonKey(name: 'fuel_charge')
  final int fuelCharge;
  @JsonKey(name: 'service_charge')
  final int serviceCharge;

  const Booking({
    required this.id,
    required this.hotelName,
    required this.hotelAdress,
    required this.rating,
    required this.ratingName,
    required this.departure,
    required this.arrivalCountry,
    required this.tourDateStart,
    required this.tourDateStop,
    required this.numberOfNights,
    required this.room,
    required this.nutrition,
    required this.tourPrice,
    required this.fuelCharge,
    required this.serviceCharge,
  });

  const Booking.empty({
    this.id = 0,
    this.hotelName = 'Отель',
    this.hotelAdress = 'Адрес',
    this.rating = 0,
    this.ratingName = 'Рейтинг',
    this.departure = 'Город',
    this.arrivalCountry = 'Страна',
    this.tourDateStart = 'Дата',
    this.tourDateStop = 'Дата',
    this.numberOfNights = 0,
    this.room = 'Номер',
    this.nutrition = 'Питание',
    this.tourPrice = 0,
    this.fuelCharge = 0,
    this.serviceCharge = 0,
  });

  factory Booking.fromJson(Map<String, dynamic> json) =>
      _$BookingFromJson(json);
  Map<String, dynamic> toJson() => _$BookingToJson(this);
}
