import 'dart:io';

void main(){
  int? a;
  int? b;
  stdout.write('enter of a:');
   a=int.parse(stdin.readLineSync()!);
  stdout.write('enter of b:');
  b=int.parse(stdin.readLineSync()!);

  int? c=a + b;
   print('sum of a AND b is $c');
}