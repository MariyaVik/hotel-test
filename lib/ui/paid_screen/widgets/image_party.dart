import 'package:flutter/material.dart';

import '../../../common/theme/app_colors.dart';

class ImageParty extends StatelessWidget {
  const ImageParty({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.greyLight,
      ),
      child: Image.asset(
        'assets/images/party.png',
        width: 44,
        height: 44,
      ),
    );
  }
}
