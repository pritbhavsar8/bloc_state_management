import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class equatable extends StatefulWidget {
  @override
  State<equatable> createState() => _equatableState();
}

class _equatableState extends State<equatable> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
         Person person = Person(name: "rahul",age: 24);
         Person person1 = Person(name: "rahul",age: 24);
         print(person.hashCode.toString());
         print(person1.hashCode.toString());
         print(person==person1);
        },
      ),
    );
  }
}
class Person extends Equatable{
   String ? name;
   int ?age;
   Person({required this.name,required this.age});
     @override
     List<Object?> get props => [name,age];

}
