void main() {
  // Create a List of integers
  List<int> numbers = [1, 2, 3, 4, 5];

  // Create a Map with String keys and String values
  Map<String, String> personInfo = {
    'name': 'John Doe',
    'age': '25',
    'city': 'New York'
  };

  // Retrieve and print values from the List
  print('List of numbers:');
  for (int number in numbers) {
    print(number);
  }

  // Retrieve and print values from the Map
  print('\nPerson Info from Map:');
  print('Name: ${personInfo['name']}');
  print('Age: ${personInfo['age']}');
  print('City: ${personInfo['city']}');

  // Add new data to List and Map
  numbers.add(6);  // Adding new number to List
  personInfo['country'] = 'USA';  // Adding new key-value pair to Map

  // Print updated List and Map
  print('\nUpdated List of numbers:');
  print(numbers);

  print('\nUpdated Person Info from Map:');
  print(personInfo);
  print('Hi M.Sufiyan');
}