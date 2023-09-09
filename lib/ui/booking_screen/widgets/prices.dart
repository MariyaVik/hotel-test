import 'package:flutter/material.dart';

import '../../../common/theme/app_colors.dart';
import '../../../common/utils.dart';
import '../../../models/booking.dart';
import '../../common/section.dart';

class Prices extends StatelessWidget {
  const Prices({
    super.key,
    required this.bookingInfo,
  });

  final Booking bookingInfo;

  @override
  Widget build(BuildContext context) {
    return Section(
        child: Column(
      children: [
        row(context, 'Тур', bookingInfo.tourPrice),
        const SizedBox(height: 16),
        row(context, 'Топливный сбор', bookingInfo.fuelCharge),
        const SizedBox(height: 16),
        row(context, 'Сервисный сбор', bookingInfo.serviceCharge),
        const SizedBox(height: 16),
        row(context, 'К оплате', 56415, true),
      ],
    ));
  }

  Widget row(BuildContext context, String itemName, int price,
      [bool bold = false]) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          itemName,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        Text(
          '${priceFormat(price)} ₽',
          style: bold
              ? Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: AppColors.blue, fontWeight: FontWeight.w600)
              : Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
