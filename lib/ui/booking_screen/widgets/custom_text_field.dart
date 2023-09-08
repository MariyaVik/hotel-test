import 'package:flutter/material.dart';

import '../../../common/theme/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final String? labelText;
  const CustomTextField({
    super.key,
    this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.greyLight,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: TextFormField(
        keyboardType: TextInputType.number,
        style: Theme.of(context).textTheme.labelLarge,
        decoration: InputDecoration(
          labelText: labelText,
        ),
      ),
    );
  }
}
