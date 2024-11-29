import 'dart:io';

void main() {
  double? n1;
  stdout.write('enter a n1');
  n1 = double.parse(stdin.readLineSync()!);
  double? n2;
  stdout.write('enter a n2');
  n2 = double.parse(stdin.readLineSync()!);
  double? n3;
  stdout.write('enter a n3');
  n3 = double.parse(stdin.readLineSync()!);
  double? Max;
  Max = n1 > n2 ? n1 : n2;
  Max = n3 > Max ? n3 : Max;
  print("max is largest $Max");
}
