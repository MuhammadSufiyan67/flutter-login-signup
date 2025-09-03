import 'dart:io';

void main() {
  // Taking input from the user
  stdout.write("Enter a number: ");
  int num = int.parse(stdin.readLineSync()!);

  // Nested if statement
  if (num > 0) {
    if (num % 2 == 0) {
      print("$num is a positive even number.");
    } else {
      print("$num is a positive odd number.");
    }
  }
}