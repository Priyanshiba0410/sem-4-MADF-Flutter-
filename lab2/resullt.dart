import 'dart:io';

void main() {
  int? n1;
  stdout.write('enter a n1');
  n1 = int.parse(stdin.readLineSync()!);
  int? n2;
  stdout.write('enter a n2');
  n2 = int.parse(stdin.readLineSync()!);
  int? n3;
  stdout.write('enter a n3');
  n3 = int.parse(stdin.readLineSync()!);
  int? n4;
  stdout.write('enter a n4');
  n4 = int.parse(stdin.readLineSync()!);
  int? n5;
  stdout.write('enter a n5');
  n5 = int.parse(stdin.readLineSync()!);
  double? per=(n1+n2+n3+n4+n5)/5;
  print('percentage $per');
  if(per<35){
print("fail");
}
else if (per<=45){
print("pass class");
}
else if (per<=60){
print("second class");
}
else if (per<=70){
print("first class");
}
else if (per>70){
print("dist");
}
}

