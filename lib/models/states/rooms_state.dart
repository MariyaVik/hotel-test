import '../room.dart';

class RoomsState {
  final List<Room> rooms;
  final bool isLoading;

  const RoomsState({
    this.rooms = const [],
    this.isLoading = true,
  });

  RoomsState copyWith({
    List<Room>? rooms,
    bool? isLoading,
  }) {
    return RoomsState(
      rooms: rooms ?? this.rooms,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RoomsState &&
          runtimeType == other.runtimeType &&
          isLoading == other.isLoading &&
          rooms == other.rooms;

  @override
  int get hashCode => rooms.hashCode ^ isLoading.hashCode;

  @override
  String toString() => 'roomsState{rooms: $rooms, isLoading: $isLoading}';
}
