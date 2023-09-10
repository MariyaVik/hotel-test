import 'package:flutter/services.dart';

class PhoneFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
// сделать нормальное разделение и вообще всё сделать нормально
    final onlyPhone = newValue.text.replaceAll('-', '');

    final chars = onlyPhone.split(RegExp(r'[(,),-, ,+]*'));

    final bool isAdd = oldValue.text.length < newValue.text.length;
    int cursorPos = 0;

    if (isAdd) {
      chars.removeLast();
    } else {
      // проверяем на '-', подумать лучше
      if (newValue.selection.start == 12) {
        print('12');
        chars.removeAt(newValue.selection.start - 1 - 4);
        cursorPos = oldValue.selection.start - 2;
      } else if (newValue.selection.start == 15) {
        print('15');
        chars.removeAt(newValue.selection.start - 1 - 5);
        cursorPos = oldValue.selection.start - 2;
      } else if (newValue.selection.start == 8) {
        print('8');
        chars.removeAt(newValue.selection.start - 1 - 3);
        cursorPos = oldValue.selection.start - 3;
      } else if (newValue.selection.start < 5) {
        print('3');
        cursorPos = 4;
      } else {
        cursorPos = oldValue.selection.start - 1;
      }
      chars.add('*');
    }

    String newText =
        '+7 (${chars.getRange(2, 5).join()}) ${chars.getRange(5, 8).join()}-${chars.getRange(8, 10).join()}-${chars.getRange(10, 12).join()}';

    if (isAdd) {
      cursorPos = newText.indexOf('*');
      cursorPos = cursorPos == -1 ? newText.length : cursorPos;
    }

    return TextEditingValue(
        text: newText, selection: TextSelection.collapsed(offset: cursorPos));
  }
}
