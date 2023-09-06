import 'package:flutter/material.dart';
import '../../../models/hotel_info.dart';
import '../../common/peculiarity.dart';
import '../../common/section.dart';
import 'details_info.dart';

class MoreInfo extends StatelessWidget {
  final HotelInfo hotel;
  const MoreInfo({
    super.key,
    required this.hotel,
  });

  @override
  Widget build(BuildContext context) {
    return Section(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Об отеле',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 16),
          Peculiarity(
            text: hotel.peculiarities[0],
          ),
          const SizedBox(height: 12),
          Text(hotel.description),
          const SizedBox(height: 16),
          const DetailsInfo(),
        ],
      ),
    );
  }
}
