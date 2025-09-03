
import 'dart:io';

void main() {
  // Taking input from the user
  stdout.write("Enter a number: ");
  int num = int.parse(stdin.readLineSync()!);

  // If-else statement
  if (num > 0) {
    print("$num is a positive number.");
  } else {
    print("$num is a negative number.");
  }
}