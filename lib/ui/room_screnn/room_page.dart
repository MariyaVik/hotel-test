import 'package:flutter/material.dart';

import '../../main.dart';
import '../../models/room.dart';
import 'widgets/room_card.dart';

class RoomPage extends StatefulWidget {
  const RoomPage({super.key});

  @override
  State<RoomPage> createState() => _RoomPageState();
}

class _RoomPageState extends State<RoomPage> {
  List<Room>? rooms;
  @override
  void initState() {
    super.initState();
    client.getRoomsMap().then((it) {
      rooms = it.rooms;
      logger.i(it);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('СОХРАНЯТЬ НАЗВАНИЕ ОТЕЛЯ'),
      ),
      body: rooms == null
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: ListView.separated(
                  itemBuilder: (context, index) =>
                      RoomCard(room: rooms![index]),
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 8),
                  itemCount: rooms!.length),
            ),
    );
  }
}
