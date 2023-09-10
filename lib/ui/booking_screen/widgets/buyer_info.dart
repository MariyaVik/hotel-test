import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubits/booking_cubit.dart';
import '../../common/phone_formatter.dart';
import '../../common/section.dart';
import 'custom_text_field.dart';

class BuyerInfo extends StatefulWidget {
  const BuyerInfo({super.key});

  @override
  State<BuyerInfo> createState() => _BuyerInfoState();
}

class _BuyerInfoState extends State<BuyerInfo> {
  @override
  Widget build(BuildContext context) {
    return Section(
      child: Form(
        key: BlocProvider.of<BookingCubit>(context).formKeys[0],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Информация о покупателе',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 20),
            CustomTextField(
              labelText: 'Номер телефона',
              isPhone: true,
              isSingle: true,
              textEditingController: TextEditingController(),
              inputType: TextInputType.number,
              inputFormatters: [PhoneFormatter()],
              validator: (String? value) {
                if (value == null ||
                    value == '' ||
                    RegExp(r'[*]').hasMatch(value)) {
                  return '';
                }
                return null;
              },
            ),
            const SizedBox(height: 8),
            CustomTextField(
              textEditingController: TextEditingController(),
              labelText: 'Почта',
              inputType: TextInputType.emailAddress,
              isSingle: true,
              validator: (String? value) {
                if (value == null ||
                    value == '' ||
                    !RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                        .hasMatch(value)) {
                  return '';
                }
                return null;
              },
            ),
            const SizedBox(height: 8),
            Text(
              'Эти данные никому не передаются. После оплаты мы вышли чек на указанный вами номер и почту',
              style:
                  Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
