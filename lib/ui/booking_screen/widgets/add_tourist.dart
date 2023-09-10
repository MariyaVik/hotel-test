import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/theme/app_colors.dart';
import '../../../cubits/booking_cubit.dart';
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
        GestureDetector(
          onTap: () {
            BlocProvider.of<BookingCubit>(context).addToutist();
          },
          child: Container(
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
        ),
      ],
    ));
  }
}
