import 'package:flutter/material.dart';

import '../../common/theme/app_colors.dart';
import 'widgets/explanation_text.dart';
import 'widgets/image_party.dart';
import 'widgets/title_text.dart';

class PaidPage extends StatelessWidget {
  const PaidPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text('Заказ оплачен'),
      ),
      body: const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ImageParty(),
            SizedBox(height: 32),
            TitleText(),
            ExplanationText(),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: ElevatedButton(
          onPressed: () {},
          child: Text('Супер!'),
        ),
      ),
    );
  }
}
