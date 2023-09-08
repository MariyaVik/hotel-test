import 'package:flutter/material.dart';
import 'package:hotel_test/ui/common/section.dart';

import '../../../common/theme/app_colors.dart';
import '../../../models/booking.dart';
import '../../common/rating.dart';

class HotelInfoWidget extends StatelessWidget {
  final Booking booking;
  const HotelInfoWidget({
    super.key,
    required this.booking,
  });

  @override
  Widget build(BuildContext context) {
    return Section(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Rating(
          name: booking.ratingName,
          rating: booking.rating,
        ),
        const SizedBox(height: 8),
        Text(
          booking.hotelName,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 8),
        GestureDetector(
          // подумать, может лучше text button
          onTap: () {},
          child: Text(
            booking.hotelAdress,
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .copyWith(color: AppColors.blue),
          ),
        ),
      ],
    ));
  }
}
