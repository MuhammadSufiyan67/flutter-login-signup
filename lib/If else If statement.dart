import 'dart:io';

void main() {
  // Taking input from the user
  stdout.write("Enter a number: ");
  int num = int.parse(stdin.readLineSync()!);

  // If-else-if ladder
  if (num > 0) {
    print("$num is a positive number.");
  } else if (num < 0) {
    print("$num is a negative number.");
  } else {
    print("The number is zero.");
  }
}