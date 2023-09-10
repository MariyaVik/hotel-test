import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../common/navigation/route_name.dart';
import '../../cubits/hotel_cubit.dart';
import '../../models/states/hotel_state.dart';
import 'widgets/main_info.dart';
import 'widgets/more_info.dart';

class HotelPage extends StatelessWidget {
  const HotelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text('Отель'),
      ),
      body: BlocBuilder<HotelCubit, HotelState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView(
            children: [
              MainInfo(hotel: state.hotel),
              const SizedBox(height: 8),
              MoreInfo(hotel: state.hotel.hotelInfo),
              const SizedBox(height: 12),
            ],
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: ElevatedButton(
          onPressed: () {
            context.pushNamed(RouteName.room);
          },
          child: const Text('К выбору номера'),
        ),
      ),
    );
  }
}
