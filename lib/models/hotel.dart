import 'package:json_annotation/json_annotation.dart';

import 'hotel_info.dart';

part 'hotel.g.dart';

@JsonSerializable(explicitToJson: true)
class Hotel {
  int id;
  String name;
  String adress;
  @JsonKey(name: 'minimal_price')
  int minimalPrice;
  @JsonKey(name: 'price_for_it')
  String priceForIt;
  int rating;
  @JsonKey(name: 'rating_name')
  String ratingName;
  @JsonKey(name: 'image_urls')
  List<String> imageUrls;
  @JsonKey(name: 'about_the_hotel')
  HotelInfo hotelInfo;

  Hotel({
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

  factory Hotel.fromJson(Map<String, dynamic> json) => _$HotelFromJson(json);
  Map<String, dynamic> toJson() => _$HotelToJson(this);

  @override
  String toString() {
    return '\nname: $name';
  }
}
