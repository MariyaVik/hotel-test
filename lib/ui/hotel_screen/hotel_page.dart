import 'package:flutter/material.dart';

import 'package:hotel_test/main.dart';
import 'widgets/main_info.dart';
import 'widgets/more_info.dart';

class HotelPage extends StatefulWidget {
  const HotelPage({super.key});

  @override
  State<HotelPage> createState() => _HotelPageState();
}

class _HotelPageState extends State<HotelPage> {
  @override
  void initState() {
    super.initState();
    client.getHotel().then((it) {
      hotel = it;
      logger.i(hotel);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text('Отель'),
      ),
      body: hotel == null
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              children: [
                MainInfo(hotel: hotel!),
                const SizedBox(height: 8),
                MoreInfo(hotel: hotel!.hotelInfo),
                const SizedBox(height: 12),
              ],
            ),
      bottomNavigationBar: BottomAppBar(
        child: ElevatedButton(
          onPressed: () {},
          child: Text('К выбору номера'),
        ),
      ),
    );
  }
}
