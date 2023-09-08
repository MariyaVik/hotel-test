import 'package:flutter/material.dart';

import '../../common/section.dart';
import 'custom_text_field.dart';

class BuyerInfo extends StatelessWidget {
  const BuyerInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Section(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Информация о покупателе',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 20),
          CustomTextField(labelText: 'Номер телефона'),
          const SizedBox(height: 8),
          CustomTextField(labelText: 'Почта'),
          const SizedBox(height: 8),
          Text(
            'Эти данные никому не передаются. После оплаты мы вышли чек на указанный вами номер и почту',
            style:
                Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
