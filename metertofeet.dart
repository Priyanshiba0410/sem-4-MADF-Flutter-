import 'dart:io';

void main()
{
  double? m;
  stdout.write('enter a m');
  m=double.parse(stdin.readLineSync()!);
  double? f=m*3.281;
  print('meter to feet $f');
}