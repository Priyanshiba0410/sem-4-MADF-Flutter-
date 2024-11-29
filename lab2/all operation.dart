import 'dart:io';

void main() {
  double? n1;
  stdout.write('enter a n1');
  n1 = double.parse(stdin.readLineSync()!);
  double? n2;
  stdout.write('enter a n2');
  n2 = double.parse(stdin.readLineSync()!);
  double? x;
  double? a = n1 + n2;
  double? b = n1 - n2;
  double? c = n1 * n2;
  double? d = n1 / n2;

  if (a != 0) {
    print('addition $a');
  }
   if (b != 0) {
    print('substaction $b');
  }
   if (c != 0) {
    print('multiplication $c');
  }
   if (d != 0) {
    print('division $d');
  }
  else {
    print('invalid choice');
  }
}
