import 'dart:io';
void main() {
  List<int> numbers = [];
  print('Enter 5 numbers:');
  for (int i = 0; i < 5; i++) {
    stdout.write('Number ${i + 1}: ');
    int? number = int.tryParse(stdin.readLineSync()!);
    if (number != null) {
      numbers.add(number);
    }
    else {
      print('Invalid input. Please enter a valid number.');
      i--;
    }
  }
  numbers.sort();
  print('Numbers in increasing order:');
  for (int number in numbers) {
    print(number);
  }
}