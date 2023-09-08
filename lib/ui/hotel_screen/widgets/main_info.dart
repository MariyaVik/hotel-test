import 'package:flutter/material.dart';

import '../../../common/theme/app_colors.dart';
import '../../../models/hotel.dart';
import '../../common/carousel_with_indicator.dart';
import '../../common/section.dart';
import '../../common/rating.dart';

class MainInfo extends StatelessWidget {
  final Hotel hotel;
  const MainInfo({
    super.key,
    required this.hotel,
  });

  @override
  Widget build(BuildContext context) {
    return Section(
      radiusTopLeft: 0,
      radiusTopRight: 0,
      paddingTop: 0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CarouselWithIndicator(images: hotel.imageUrls),
          const SizedBox(height: 16),
          Rating(
            name: hotel.ratingName,
            rating: hotel.rating,
          ),
          const SizedBox(height: 8),
          Text(
            hotel.name,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          GestureDetector(
            // подумать, может лучше text button
            onTap: () {},
            child: Text(
              hotel.adress,
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: AppColors.blue),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            // crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'от ${hotel.minimalPrice} ₽',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(width: 8),
              Text(
                hotel.priceForIt.toLowerCase(),
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          )
        ],
      ),
    );
  }
}
