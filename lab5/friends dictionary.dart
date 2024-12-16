import 'dart:io';
void main() {
class Friend {
  final String name;
  final int age;
  final String email;

  Friend({required this.name, required this.age, required this.email});

  @override
  String toString() {
    return 'Name: $name, Age: $age, Email: $email';
  }
}

void main() {
  final Map<String, Friend> friends = {
    'Alice': Friend(name: 'Alice', age: 25, email: 'alice@example.com'),
    'Bob': Friend(name: 'Bob', age: 30, email: 'bob@example.com'),
    'Charlie': Friend(name: 'Charlie', age: 22, email: 'charlie@example.com'),
  };

  String searchName = 'Bob';
  Friend? friend = friends[searchName];

  if (friend != null) {
    print('Friend details: $friend');
  } else {
    print('Friend not found');
  }
}
