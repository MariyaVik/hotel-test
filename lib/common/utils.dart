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
