import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_test/ui/common/constants.dart';

import '../../../common/theme/app_colors.dart';
import '../../../common/utils.dart';
import '../../../cubits/booking_cubit.dart';
import '../../common/date_formatter.dart';
import '../../common/section.dart';
import 'custom_text_field.dart';
import 'expanded_section.dart';

class TouristCard extends StatefulWidget {
  final int touristNumber;
  final bool expand;

  const TouristCard({
    super.key,
    this.expand = false,
    required this.touristNumber,
  });
  @override
  State<TouristCard> createState() => _TouristCardState();
}

class _TouristCardState extends State<TouristCard> {
  late bool _expand;

  @override
  void initState() {
    super.initState();
    _expand = widget.expand;
  }

  @override
  Widget build(BuildContext context) {
    return Section(
      child: Column(
        children: [
          Header(
            number: widget.touristNumber,
            isCollapse: !_expand,
            onTap: () {
              setState(() {
                _expand = !_expand;
              });
            },
          ),
          ExpandedSection(
            expand: _expand,
            child: Content(number: widget.touristNumber),
          )
        ],
      ),
    );
  }
}

class Header extends StatelessWidget {
  final bool isCollapse;
  final VoidCallback onTap;
  final int number;

  const Header({
    super.key,
    required this.onTap,
    required this.isCollapse,
    required this.number,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '${ordinalNumber(number)} турист',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: AppColors.blue.withOpacity(0.1),
            ),
            child: AnimatedRotation(
              turns: isCollapse ? 0 : 0.5,
              duration: animDuration,
              child: const Icon(
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
  final int number;
  const Content({
    super.key,
    required this.number,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: BlocProvider.of<BookingCubit>(context).formKeys[number],
      child: Column(
        children: [
          const SizedBox(height: 20),
          CustomTextField(
            labelText: 'Имя',
            validator: (String? value) {
              if (value == null || value == '') {
                return '';
              }
              return null;
            },
          ),
          const SizedBox(height: 8),
          CustomTextField(
            labelText: 'Фамилия',
            validator: (String? value) {
              if (value == null || value == '') {
                return '';
              }
              return null;
            },
          ),
          const SizedBox(height: 8),
          CustomTextField(
            inputType: TextInputType.number,
            labelText: 'Дата рождения',
            inputFormatters: [DateFormatter()],
            validator: (String? value) {
              if (value == null || value == '') {
                return '';
              }
              return null;
            },
          ),
          const SizedBox(height: 8),
          CustomTextField(
            labelText: 'Гражданство',
            validator: (String? value) {
              if (value == null || value == '') {
                return '';
              }
              return null;
            },
          ),
          const SizedBox(height: 8),
          CustomTextField(
            inputType: TextInputType.number,
            labelText: 'Номер загранпаспорта',
            validator: (String? value) {
              if (value == null || value == '') {
                return '';
              }
              return null;
            },
          ),
          const SizedBox(height: 8),
          CustomTextField(
            inputType: TextInputType.number,
            labelText: 'Срок действия загранпаспорта',
            textInputAction: TextInputAction.done,
            inputFormatters: [DateFormatter()],
            validator: (String? value) {
              if (value == null || value == '') {
                return '';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
