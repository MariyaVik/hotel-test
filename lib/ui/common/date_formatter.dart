import 'package:flutter/services.dart';

class DateFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String newText = newValue.text;
    final bool isAdd = oldValue.text.length < newValue.text.length;
    int cursorPos = newValue.selection.start;
    if (isAdd) {
      if (newValue.text.length >= 11) {
        newText = oldValue.text;
        cursorPos -= 1;
      } else if (newValue.text.length == 2 || newValue.text.length == 5) {
        newText += '.';
        cursorPos += 1;
      }
    } else {
      if (newValue.text.length == 2 || newValue.text.length == 5) {
        newText = newValue.text.substring(0, newValue.text.length - 1);
        cursorPos -= 1;
      }
    }

    return TextEditingValue(
        text: newText, selection: TextSelection.collapsed(offset: cursorPos));
  }
}
