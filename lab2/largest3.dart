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
    if(n1>n2){
      if(n1>n3){
        print('n1 is max $n1');
      }
      else{
        print('n3 is max $n3');
      }
    }
    else{
      if(n2>n3){
        print('n2 is max $n2');
      }
      else{
        print('n3 is max $n3');
      }
    }
        }

