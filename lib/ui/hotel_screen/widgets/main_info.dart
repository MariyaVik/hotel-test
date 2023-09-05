import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../models/hotel.dart';
import '../../common/section.dart';
import 'rating.dart';

class MainInfo extends StatelessWidget {
  final Hotel hotel;
  const MainInfo({
    super.key,
    required this.hotel,
  });

  @override
  Widget build(BuildContext context) {
    return Section(
      radiusTopLeft: 0,
      radiusTopRight: 0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CarouselSlider.builder(
              itemCount: hotel.imageUrls.length,
              itemBuilder: (context, index, realIndex) {
                return Image.network(hotel.imageUrls[index]);
              },
              options: CarouselOptions()),
          Rating(
            name: hotel.ratingName,
            rating: hotel.rating,
          ),
          Text(hotel.name),
          Text(hotel.adress),
          Row(
            children: [
              Text('от ${hotel.minimalPrice} ₽'),
              const SizedBox(width: 8),
              Text(hotel.priceForIt.toLowerCase()),
            ],
          )
        ],
      ),
    );
  }
}
