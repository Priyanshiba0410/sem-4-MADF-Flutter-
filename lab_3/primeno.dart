import 'dart:io';

void main() {
  int? a;
  stdout.write('enter a ');
  a = int.parse(stdin.readLineSync()!);
  int sum = 0;
  for(int i=1;i<=a;i++){
    if(a%i==0){
      sum++;
    }
  }
  if(sum==2){
    print('prime');
  }
  else{
    print('not_prime');
  }
}