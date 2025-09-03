import 'dart:io';

void main()
{
  // Taking input from the user
  print("Enter a number: ");
  int num = int.parse(stdin.readLineSync()!);

  if (num > 0) {
    print("$num is a positive number ");
  }
}