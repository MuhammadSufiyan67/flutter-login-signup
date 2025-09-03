import 'dart:io';

void main() {
  // Assignment Operator
  int a = 5;  // Assigning value 5 to variable a
  int b = 10; // Assigning value 10 to variable b
  print("Initial values: a = $a, b = $b");

  // Arithmetic Operators
  int sum = a + b;
  int difference = b - a;
  int product = a * b;
  double quotient = b / a;
  int remainder = b % a;
  print("\nArithmetic Operations:");
  print("Sum of a and b: $sum");
  print("Difference of b and a: $difference");
  print("Product of a and b: $product");
  print("Quotient of b divided by a: $quotient");
  print("Remainder of b divided by a: $remainder");

  // Relational Operators
  print("\nRelational Operations:");
  print("Is a equal to b? ${a == b}");  // Equals
  print("Is a not equal to b? ${a != b}");  // Not Equals
  print("Is a greater than b? ${a > b}");  // Greater Than
  print("Is a less than b? ${a < b}");  // Less Than
  print("Is a greater than or equal to b? ${a >= b}");  // Greater Than or Equal To
  print("Is a less than or equal to b? ${a <= b}");  // Less Than or Equal To

  // Logical Operators
  bool x = true;
  bool y = false;

  print("\nLogical Operations:");
  print("x AND y: ${x && y}");  // Logical AND
  print("x OR y: ${x || y}");  // Logical OR
  print("NOT x: ${!x}");  // Logical NOT

  // Unary Operators
  int i = 5;
  int j = -i;  // Unary minus
  i++; // Post-increment
  j--; // Post-decrement
  print("\nUnary Operations:");
  print("Unary minus of i: $j");
  print("i after post-increment: $i");
  print("j after post-decrement: $j");

  // Compound Assignment Operators (+=, -=, *=, /=, %=)
  a += 5;  // a = a + 5
  b -= 3;  // b = b - 3
  print("\nAfter using Compound Assignment Operators:");
  print("a += 5, new value of a = $a");
  print("b -= 3, new value of b = $b");

  // Ternary Operator
  int largest = (a > b) ? a : b;  // Ternary operation (if-else shorthand)
  print("\nTernary Operator:");
  print("The largest value between a and b is: $largest");

  // Taking input from the user and performing an operation
  stdout.write("\nEnter a number to multiply with 10: ");
  int userInput = int.parse(stdin.readLineSync()!);
  int result = userInput * 10;
  print("The result of multiplying your number by 10 is: $result");

  // Using the Assignment Operator to assign a new value to `a` and `b`
  print("\nReassigning values:");
  a = 15;  // Reassign value to a
  b = 30;  // Reassign value to b
  print("Reassigned values: a = $a, b = $b");
}
