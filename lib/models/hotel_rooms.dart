import 'package:json_annotation/json_annotation.dart';

import 'room.dart';

part 'hotel_rooms.g.dart';

@JsonSerializable(explicitToJson: true)
class HotelRooms {
  List<Room> rooms;

  HotelRooms({required this.rooms});

  factory HotelRooms.fromJson(Map<String, dynamic> json) =>
      _$HotelRoomsFromJson(json);
  Map<String, dynamic> toJson() => _$HotelRoomsToJson(this);
}