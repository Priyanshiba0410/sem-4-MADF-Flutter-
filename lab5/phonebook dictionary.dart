import 'dart:io';
void main() {
  Map<String, String> phone = {
    'shreeya': '1234567890',
    'piyu': '2345678901',
    'prince': '3456789012'
  };
  print('Phonebook entries:');
  phone.forEach((name, number) {
    print('$name: $number');
  });
  print('Enter a name to search:');
  String? search = stdin.readLineSync();
  if (search != null && phone.containsKey(search)) {
    print('${search}s phone number is: ${phone[search]}');
  } else {
    print('$search is not in the phonebook.');
  }
}
