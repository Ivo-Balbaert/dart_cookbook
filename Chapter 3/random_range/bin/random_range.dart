import 'dart:math';
Random rnd = new Random();

void main() {
  int min = 13, max = 42;
  int r = min + rnd.nextInt(max - min);
  print("$r is in the range of $min and $max"); // e.g. 31
  // used as a function nextInter:
  print("${nextInter(min, max)}"); // e;g. 17
}

int nextInter(int min, int max) {
  Random rnd = new Random();
  return min + rnd.nextInt(max - min);
}