num normalizeDouble(
    num oldMin, num oldMax, num newMin, num newMax, num number) {
  num oldRange = oldMax - oldMin;
  num newRange = newMax - newMin;
  return ((number - oldMin) * newRange / oldRange) + newMin;
}
