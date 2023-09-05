import 'package:flutter/material.dart';

class Section extends StatelessWidget {
  final Widget child;
  final double radiusTopLeft;
  final double radiusTopRight;
  final double radiusBottomLeft;
  final double radiusBottomRight;
  const Section({
    super.key,
    required this.child,
    this.radiusBottomLeft = 12,
    this.radiusBottomRight = 12,
    this.radiusTopLeft = 12,
    this.radiusTopRight = 12,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(radiusTopLeft),
          topRight: Radius.circular(radiusTopRight),
          bottomLeft: Radius.circular(radiusBottomLeft),
          bottomRight: Radius.circular(radiusBottomRight),
        ),
        color: Theme.of(context)
            .colorScheme
            .secondaryContainer, // сделать белый в светлой теме
      ),
      child: child,
    );
  }
}
