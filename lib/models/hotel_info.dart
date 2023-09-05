import 'package:json_annotation/json_annotation.dart';

part 'hotel_info.g.dart';

@JsonSerializable()
class HotelInfo {
  String description;
  List<String> peculiarities;

  HotelInfo({
    required this.description,
    required this.peculiarities,
  });

  factory HotelInfo.fromJson(Map<String, dynamic> json) =>
      _$HotelInfoFromJson(json);
  Map<String, dynamic> toJson() => _$HotelInfoToJson(this);
}
