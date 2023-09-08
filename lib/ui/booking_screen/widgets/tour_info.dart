import 'package:flutter/material.dart';

import '../../../common/utils.dart';
import '../../../models/booking.dart';
import '../../common/section.dart';

class TourInfo extends StatelessWidget {
  final Booking booking;
  const TourInfo({
    super.key,
    required this.booking,
  });

  @override
  Widget build(BuildContext context) {
    return Section(
        child: Table(
      columnWidths: const <int, TableColumnWidth>{
        0: FlexColumnWidth(5),
        1: FlexColumnWidth(7),
      },
      children: [
        TableRow(children: [
          itemName(context, 'Вылет из'),
          Text(booking.departure),
        ]),
        rowSpacer(),
        TableRow(children: [
          itemName(context, 'Страна, город'),
          Text(booking.arrivalCountry),
        ]),
        rowSpacer(),
        TableRow(children: [
          itemName(context, 'Даты'),
          Text('${booking.tourDateStart}-${booking.tourDateStop}'),
        ]),
        rowSpacer(),
        TableRow(children: [
          itemName(context, 'Кол-во ночей'),
          Text(
              '${booking.numberOfNights} ${getWordOrg(booking.numberOfNights, 'ночь', 'ночи', 'ночей')}'),
        ]),
        rowSpacer(),
        TableRow(children: [
          itemName(context, 'Отель'),
          Text(booking.hotelName),
        ]),
        rowSpacer(),
        TableRow(children: [
          itemName(context, 'Номер'),
          Text(booking.room),
        ]),
        rowSpacer(),
        TableRow(children: [
          itemName(context, 'Питание'),
          Text(booking.nutrition),
        ]),
      ],
    ));
  }

  TableRow rowSpacer() {
    return const TableRow(
      children: [SizedBox(height: 16), SizedBox(height: 16)],
    );
  }

  Widget itemName(BuildContext context, String text) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodySmall,
    );
  }
}
