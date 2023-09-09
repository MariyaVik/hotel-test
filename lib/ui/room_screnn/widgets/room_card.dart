import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../common/navigation/route_name.dart';
import '../../../common/theme/app_colors.dart';
import '../../../common/utils.dart';
import '../../../models/room.dart';
import '../../common/carousel_with_indicator.dart';
import '../../common/peculiarity.dart';
import '../../common/section.dart';

class RoomCard extends StatelessWidget {
  final Room room;
  const RoomCard({
    super.key,
    required this.room,
  });

  @override
  Widget build(BuildContext context) {
    return Section(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CarouselWithIndicator(
          images: room.imageUrls,
        ),
        const SizedBox(height: 8),
        Text(
          room.name,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 8),
        Peculiarity(
          text: room.peculiarities[0],
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: AppColors.blue.withOpacity(0.1),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Подробнее о номере',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: AppColors.blue),
              ),
              const SizedBox(width: 2),
              const Icon(
                Icons.arrow_forward_ios_rounded,
                color: AppColors.blue,
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Row(
          // crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              '${priceFormat(room.price)} ₽',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(width: 8),
            Text(
              room.pricePer.toLowerCase(),
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
        const SizedBox(height: 16),
        SizedBox(
          width: double.infinity,
          height: 48,
          child: ElevatedButton(
            onPressed: () {
              context.pushNamed(RouteName.booking);
            },
            child: const Text('Выбрать номер'),
          ),
        ),
      ],
    ));
  }
}
