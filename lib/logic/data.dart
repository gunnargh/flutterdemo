 import 'dart:math';

 class Customer {
  String name;
  int age;

  Customer(this.name, this.age);

  @override
  String toString() {
    return '{ ${this.name}, ${this.age} }';
  }
}
List <Customer> getCustomers() {
  List <Customer> customers = [];
 List<String> names = [
    'Olivia', 'Liam', 'Emma', 'Noah', 'Ava', 'Oliver', 'Sophia', 'Ethan',
    'Charlotte', 'Lucas', 'Amelia', 'Henry', 'Mia', 'Sebastian', 'Harper',
    'Leo', 'Ella', 'Owen', 'Scarlett', 'Wyatt', 'Emily', 'Elijah', 'Luna',
    'Grayson', 'Chloe', 'Mason', 'Aria', 'Benjamin', 'Avery', 'Daniel',
  ];

  // Random number generator
  Random random = Random();

  // Generate 25 fake customers
  for (int i = 0; i < 25; i++) {
    String randomName = names[i];
    int randomAge = random.nextInt(60) + 18; // Random age between 18 and 77

    customers.add(Customer(randomName, randomAge));
  }
  return customers;
}
List <Customer> orderList(List <Customer> cs,bool listOrder) {
   if(listOrder) {
     cs.sort((a,b) => b.name.compareTo(a.name));
   } else {
     cs.sort((a,b) => a.name.compareTo(b.name));
   }
  return cs;
}