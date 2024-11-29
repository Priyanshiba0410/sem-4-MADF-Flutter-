import 'dart:io';

void main(){
  double? a;
  double? b;
  double? c;
  double? d;
  double? e;
  stdout.write('enter a');
  a=double.parse(stdin.readLineSync()!);
  stdout.write('enter b');
  b=double.parse(stdin.readLineSync()!);
  stdout.write('enter c');
  c=double.parse(stdin.readLineSync()!);
  stdout.write('enter d');
  d=double.parse(stdin.readLineSync()!);
  stdout.write('enter e');
  e=double.parse(stdin.readLineSync()!);
  double? avg=((a+b+c+d+e)/(500))*100;
  print('percentage $avg');

}