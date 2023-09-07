import 'package:flutter/material.dart';

class Section extends StatelessWidget {
  final Widget child;
  final double radiusTopLeft;
  final double radiusTopRight;
  final double radiusBottomLeft;
  final double radiusBottomRight;
  final double paddingTop;
  final double paddingRight;
  final double paddingBottom;
  final double paddingLeft;
  const Section({
    super.key,
    required this.child,
    this.radiusBottomLeft = 12,
    this.radiusBottomRight = 12,
    this.radiusTopLeft = 12,
    this.radiusTopRight = 12,
    this.paddingTop = 16,
    this.paddingRight = 16,
    this.paddingBottom = 16,
    this.paddingLeft = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: paddingTop,
        bottom: paddingBottom,
        right: paddingRight,
        left: paddingLeft,
      ),
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
