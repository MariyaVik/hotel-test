import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/hotel_cubit.dart';
import '../../cubits/room_cubit.dart';
import '../../models/states/hotel_state.dart';
import '../../models/states/rooms_state.dart';
import 'widgets/room_card.dart';

class RoomPage extends StatelessWidget {
  const RoomPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocConsumer<HotelCubit, HotelState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Text(state.hotel.name);
          },
        ),
      ),
      body: BlocBuilder<RoomsCubit, RoomsState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: ListView.separated(
                itemBuilder: (context, index) =>
                    RoomCard(room: state.rooms[index]),
                separatorBuilder: (context, index) => const SizedBox(height: 8),
                itemCount: state.rooms.length),
          );
        },
      ),
    );
  }
}
