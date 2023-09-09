import 'package:boxy/boxy.dart';
import 'package:flutter/material.dart';

import 'peculiarity.dart';

class PeculiarityLayout extends StatelessWidget {
  final double horizontalSpace;
  final double verticalSpace;
  final List<String> peculiarities;
  const PeculiarityLayout({
    super.key,
    required this.peculiarities,
    this.horizontalSpace = 8,
    this.verticalSpace = 8,
  });

  @override
  Widget build(BuildContext context) {
    peculiarities.shuffle(); // для тестирования разных вариантов
    return CustomBoxy(
      delegate: DelegateBoxy(peculiarities.length),
      children: List.generate(
        peculiarities.length,
        (index) => LayoutId(
          id: index,
          child: Peculiarity(text: peculiarities[index]),
        ),
      ),
    );
  }
}

class DelegateBoxy extends BoxyDelegate {
  final int count;
  final double horizontalSpace;
  final double verticalSpace;
  DelegateBoxy(
    this.count, {
    this.horizontalSpace = 8,
    this.verticalSpace = 8,
  });

  @override
  Size layout() {
    double x = 0;
    double y = 0;
    double lastHeight = 0;
    for (int i = 0; i < count; i++) {
      var child = getChild(i);
      final element = child.layout(BoxConstraints.loose(
          Size(constraints.maxWidth, constraints.maxHeight)));
      if (x == 0) {
        child.position(Offset(x, y));
        x += element.width + horizontalSpace;
      } else if (x + element.width + horizontalSpace < constraints.maxWidth) {
        child.position(Offset(x, y));
        x += element.width + horizontalSpace;
      } else {
        x = 0;
        y += lastHeight + verticalSpace;
        child.position(Offset(x, y));
        x += element.width + horizontalSpace;
      }
      lastHeight = element.height;
    }
    return Size(
      constraints.maxWidth,
      y + lastHeight,
    );
  }
}
