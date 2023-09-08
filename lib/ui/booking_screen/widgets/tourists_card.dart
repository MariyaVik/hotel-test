import 'package:flutter/material.dart';

import '../../../common/theme/app_colors.dart';
import '../../common/section.dart';
import 'custom_text_field.dart';

class ExpandedSection extends StatefulWidget {
  final Widget child;
  final bool expand;

  ExpandedSection({this.expand = false, required this.child});

  @override
  _ExpandedSectionState createState() => _ExpandedSectionState();
}

class _ExpandedSectionState extends State<ExpandedSection>
    with SingleTickerProviderStateMixin {
  late AnimationController expandController;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    prepareAnimations();
    _runExpandCheck();
  }

  ///Setting up the animation
  void prepareAnimations() {
    expandController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    animation = CurvedAnimation(
      parent: expandController,
      curve: Curves.fastOutSlowIn,
    );
  }

  void _runExpandCheck() {
    if (widget.expand) {
      expandController.forward();
    } else {
      expandController.reverse();
    }
  }

  @override
  void didUpdateWidget(ExpandedSection oldWidget) {
    super.didUpdateWidget(oldWidget);
    _runExpandCheck();
  }

  @override
  void dispose() {
    expandController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
        axisAlignment: 1.0, sizeFactor: animation, child: widget.child);
  }
}

class Tourist extends StatefulWidget {
  @override
  _TouristState createState() => _TouristState();
}

class _TouristState extends State<Tourist> {
  bool _expand = false;

  @override
  Widget build(BuildContext context) {
    return Section(
      child: Column(
        children: [
          Header(
            isCollapse: !_expand,
            onTap: () {
              setState(() {
                _expand = !_expand;
              });
            },
          ),
          ExpandedSection(
            child: Content(),
            expand: _expand,
          )
        ],
      ),
    );
  }
}

class Header extends StatelessWidget {
  final bool isCollapse;
  final VoidCallback onTap;

  Header({
    required this.onTap,
    required this.isCollapse,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Первый турист',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: AppColors.blue.withOpacity(0.1),
            ),
            child: AnimatedRotation(
              turns: isCollapse ? 0 : 0.5,
              duration: Duration(seconds: 1),
              child: Icon(
                Icons.keyboard_arrow_down_rounded,
                color: AppColors.blue,
                size: 32,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Content extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20),
        CustomTextField(labelText: 'Номер телефона'),
        const SizedBox(height: 8),
        CustomTextField(labelText: 'Почта'),
        const SizedBox(height: 8),
        CustomTextField(labelText: 'Номер телефона'),
        const SizedBox(height: 8),
        CustomTextField(labelText: 'Почта'),
        const SizedBox(height: 8),
        CustomTextField(labelText: 'Номер телефона'),
        const SizedBox(height: 8),
        CustomTextField(labelText: 'Почта'),
      ],
    );
  }
}
