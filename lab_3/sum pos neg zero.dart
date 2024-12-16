import 'dart:io';

void main() {

int num;
int sumPositiveEven = 0;
int sumNegativeOdd = 0;
stdout.write('enter num ');
num = int.parse(stdin.readLineSync()!);
print("Enter numbers (enter 0 to quit):");
  if (num == 0) {
    if (num > 0 && num % 2 == 0) {
      sumPositiveEven += num;
    } else if (num < 0 && num % 2 != 0) {
      sumNegativeOdd += num;
  }
}
print(sumPositiveEven);
print(sumNegativeOdd);

}
