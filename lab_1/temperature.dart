import 'dart:io';

void main()
{
  double? f;
  stdout.write('enter a f');
  f=double.parse(stdin.readLineSync()!);
  double? c=((f-32)*5)/9;
  print('temp in celsius $c');
}