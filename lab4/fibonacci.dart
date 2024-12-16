void fibonacci(int a) {
  int first = 0;
  int second = 1;
  int next;
  for (int i = 0; i <= a; i++) {
    if (i <= 1) {
      next = i;
    }
    else {
      next = first + second;
      first = second;
      second = next;
    }
    print(next);
  }
}
  void main() {
    fibonacci(10);
  }
