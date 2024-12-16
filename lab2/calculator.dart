import 'dart:io';

void main() {
  double? n1;
  stdout.write('enter a n1');
  n1 = double.parse(stdin.readLineSync()!);
  double? n2;
  stdout.write('enter a n2');
  n2 = double.parse(stdin.readLineSync()!);
  {
    for(i=0;i<n1;i++){

    }
print("n1+n2",n1+n2);
print("n1-n2",n1-n2);
print("n1*n2",n1*n2);
print("n1/n2",n1/n2);
}
print("divid by  o is not valid");
}
