import 'package:intl/intl.dart';

num normalizeDouble(
    num oldMin, num oldMax, num newMin, num newMax, num number) {
  num oldRange = oldMax - oldMin;
  num newRange = newMax - newMin;
  return ((number - oldMin) * newRange / oldRange) + newMin;
}

String getWordOrg(int num, String one, String two, String five) {
  num %= 100;
  if (num >= 5 && num <= 20) {
    return five;
  }
  num %= 10;
  if (num == 1) {
    return one;
  }
  if (num >= 2 && num <= 4) {
    return two;
  }
  return five;
}

String priceFormat(int price) {
  var formatter = NumberFormat('#,###');
  return formatter.format(price.toInt()).replaceAll(',', ' ');
}

String ordinalNumber(int number) {
  const List<String> names = [
    'Первый',
    'Второй',
    'Третий',
    'Четвёртый',
    'Пятый',
    'Шестой',
    'Седьмой',
    'Восьмой',
    'Девятый',
    'Десятый',
  ];
  return names[number - 1];
}
