// ignore_for_file: depend_on_referenced_packages

import 'package:json_annotation/json_annotation.dart';

import 'hotel_info.dart';

part 'hotel.g.dart';

@JsonSerializable(explicitToJson: true)
class Hotel {
  final int id;
  final String name;
  final String adress;
  @JsonKey(name: 'minimal_price')
  final int minimalPrice;
  @JsonKey(name: 'price_for_it')
  final String priceForIt;
  final int rating;
  @JsonKey(name: 'rating_name')
  final String ratingName;
  @JsonKey(name: 'image_urls')
  final List<String> imageUrls;
  @JsonKey(name: 'about_the_hotel')
  final HotelInfo hotelInfo;

  const Hotel({
    required this.id,
    required this.name,
    required this.adress,
    required this.minimalPrice,
    required this.priceForIt,
    required this.rating,
    required this.ratingName,
    required this.imageUrls,
    required this.hotelInfo,
  });

  const Hotel.empty({
    this.id = 0,
    this.name = 'Отель',
    this.adress = 'Адрес',
    this.minimalPrice = 0,
    this.priceForIt = 'за что-то',
    this.rating = 0,
    this.ratingName = 'Рейтинг',
    this.imageUrls = const [],
    this.hotelInfo = const HotelInfo.empty(),
  });

  factory Hotel.fromJson(Map<String, dynamic> json) => _$HotelFromJson(json);
  Map<String, dynamic> toJson() => _$HotelToJson(this);

  @override
  String toString() {
    return '\nname: $name';
  }
}
