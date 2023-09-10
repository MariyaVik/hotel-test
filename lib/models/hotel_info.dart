// ignore_for_file: depend_on_referenced_packages

import 'package:json_annotation/json_annotation.dart';

part 'hotel_info.g.dart';

@JsonSerializable()
class HotelInfo {
  final String description;
  final List<String> peculiarities;

  const HotelInfo({
    required this.description,
    required this.peculiarities,
  });

  const HotelInfo.empty({
    this.description = 'Описание',
    this.peculiarities = const [],
  });

  factory HotelInfo.fromJson(Map<String, dynamic> json) =>
      _$HotelInfoFromJson(json);
  Map<String, dynamic> toJson() => _$HotelInfoToJson(this);
}
