import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../common/theme/app_colors.dart';
import '../../common/utils.dart';

class CarouselWithIndicator extends StatefulWidget {
  const CarouselWithIndicator({
    super.key,
    required this.images,
  });

  final List<String> images;

  @override
  State<CarouselWithIndicator> createState() => _CarouselWithIndicatorState();
}

class _CarouselWithIndicatorState extends State<CarouselWithIndicator> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
          child: CarouselSlider.builder(
            carouselController: _controller,
            itemCount: widget.images.length,
            itemBuilder: (context, index, realIndex) {
              return Image.network(
                widget.images[index],
                fit: BoxFit.cover,
              );
            },
            options: CarouselOptions(
              aspectRatio: 4 / 3,
              viewportFraction: 1,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              },
            ),
          ),
        ),
        Positioned(
          bottom: 8,
          child: Container(
            height: 17, // исправить
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: AppColors.white,
            ),
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () => _controller.animateToPage(index),
                  child: Container(
                    width: 7.0,
                    height: 7.0,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.black.withOpacity(_current == index
                            ? 0.9
                            : normalizeDouble(widget.images.length, 0, 0.05,
                                    0.22, (index - _current).abs())
                                .toDouble())),
                  ),
                );
              },
              itemCount: widget.images.length,
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(width: 5);
              },
            ),
          ),
        ),
      ],
    );
  }
}
