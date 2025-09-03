import 'dart:io'; // Import required for input

void main() {
  print("Enter your Name:");
  String? name = stdin.readLineSync();  // Input for string

  print("Enter your Age:");
  int age = int.parse(stdin.readLineSync()!);  // Convert input to integer

  print("Enter your GBA:");
  double gba = double.parse(stdin.readLineSync()!);  // Convert input to double

  print("Hello, $name! You are $age yearSs old and have a GBA of $gba.");
}