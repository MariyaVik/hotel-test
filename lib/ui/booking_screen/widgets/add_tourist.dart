import 'package:flutter/material.dart';

import '../../../common/theme/app_colors.dart';
import '../../common/section.dart';

class AddTourist extends StatelessWidget {
  const AddTourist({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Section(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Добавить туриста',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Container(
          height: 32,
          width: 32,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: AppColors.blue,
          ),
          child: const Icon(
            Icons.add,
            color: AppColors.white,
          ),
        ),
      ],
    ));
  }
}
