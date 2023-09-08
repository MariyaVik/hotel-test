import 'dart:math';

import 'package:flutter/material.dart';

class ExplanationText extends StatelessWidget {
  const ExplanationText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 20),
      child: Text(
        'Подтверждение заказа №${Random().nextInt(899999) + 100000} может занять некоторое время (от 1 часа до суток). Как только мы получим ответ от туроператора, вам на почту придет уведомление.',
        style: Theme.of(context).textTheme.bodySmall,
        textAlign: TextAlign.center,
      ),
    );
  }
}
