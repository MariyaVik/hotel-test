import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../common/theme/app_colors.dart';
import '../../../models/details_hotel_item.dart';

const List<DetailsHotelItem> _items = [
  DetailsHotelItem(
      title: 'Удобства',
      subtitle: 'Самое необходимое',
      image: 'assets/icons/happy.svg'),
  DetailsHotelItem(
      title: 'Что включено',
      subtitle: 'Самое необходимое',
      image: 'assets/icons/include.svg'),
  DetailsHotelItem(
      title: 'Что не включено',
      subtitle: 'Самое необходимое',
      image: 'assets/icons/not_include.svg'),
];

class DetailsInfo extends StatelessWidget {
  const DetailsInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.tertiaryContainer,
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return ListTile(
              dense: true,
              contentPadding: EdgeInsetsDirectional.zero,
              leading: SvgPicture.asset(_items[index].image),
              title: Text(
                _items[index].title,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: AppColors.black),
              ),
              subtitle: Text(
                _items[index].subtitle,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios_rounded,
              ),
            );
          },
          separatorBuilder: (context, index) => Divider(
                indent: 38, // подумать, как сделать лучше
                color: AppColors.textSecondary.withOpacity(0.15),
              ),
          itemCount: 3),
    );
  }
}
