import 'dart:io';

void main() {
  int a;
  stdout.write('enter a ');
  a = int.parse(stdin.readLineSync()!);
      int Num = 0;
    while (a != 0)
    {
      int digit = a % 10;
      Num = Num * 10 + digit;
      a = a ~/ 10;
    }
    print( Num);
  }
