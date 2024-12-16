import 'dart:io';

void main() {
  int? a;
  stdout.write('enter a ');
  a = int.parse(stdin.readLineSync()!);
  int sum = 1;
  for (int i = 1; i <= a; i++) {
    sum = sum * i;
  }
  print(sum);
}