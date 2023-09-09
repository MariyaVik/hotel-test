// ignore_for_file: depend_on_referenced_packages

import 'package:json_annotation/json_annotation.dart';

part 'room.g.dart';

@JsonSerializable()
class Room {
  final int id;
  final String name;
  final int price;
  @JsonKey(name: 'price_per')
  final String pricePer;
  final List<String> peculiarities;
  @JsonKey(name: 'image_urls')
  final List<String> imageUrls;

  const Room({
    required this.id,
    required this.name,
    required this.price,
    required this.pricePer,
    required this.peculiarities,
    required this.imageUrls,
  });

  factory Room.fromJson(Map<String, dynamic> json) => _$RoomFromJson(json);
  Map<String, dynamic> toJson() => _$RoomToJson(this);

  @override
  String toString() {
    return '\nname: $name';
  }
}
