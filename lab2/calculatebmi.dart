import 'dart:io';

void main() {
  double? w;
  stdout.write('enter a w');
  w = double.parse(stdin.readLineSync()!);
  double? h;
  stdout.write('enter a h');
  h = double.parse(stdin.readLineSync()!);
  double bmi = w / (h * h);
  print('bmi is:$bmi');
}
