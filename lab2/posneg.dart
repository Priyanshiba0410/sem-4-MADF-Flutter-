import 'dart:io';

void main() {
  int? n;
  stdout.write('enter a n');
  n = int.parse(stdin.readLineSync()!);
  if (n > 0) {
    print('number is positive $n');
  }
  else {
    print('number is negative');
  }
}
