import 'package:flutter/services.dart';

class PhoneFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    int cursorPos = newValue.text.indexOf('*');
    cursorPos = cursorPos == -1 ? newValue.text.length : cursorPos;

// сделать нормальное разделение
    final onlyPhone = newValue.text.replaceAll('-', '');

    final chars = onlyPhone.split(RegExp(r'[(,),-, ,+]*'));

    chars.removeLast();

    String newText =
        '+7 (${chars.getRange(2, 5).join()}) ${chars.getRange(5, 8).join()}-${chars.getRange(8, 10).join()}-${chars.getRange(10, 12).join()}';

    return TextEditingValue(
        text: newText, selection: TextSelection.collapsed(offset: cursorPos));
  }
}
