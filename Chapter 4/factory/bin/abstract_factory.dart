// import 'dart:math';

void main() {
  // factory as a default implementation of an abstract class:
   Cat cat = new Animal();
   var catSound = cat.makeNoise();
   print(catSound); // Meow
   // 2nd example:
//  Animal an = new Animal();
//  print(an.makeNoise());
   // 3rd example:
//  Cat cat = new Animal("cat");
//  Dog dog = new Animal("dog");
}

abstract class Animal {
   String makeNoise();
   factory Animal() => new Cat();
   // 2nd example:
   // simulates computation:
//   factory Animal() {
//       var random = new Random();
//       if (random.nextBool())
//         return new Cat();
//       else
//         return new Dog();
//   }
   // 3rd example:
//   factory Animal(String type) {
//       switch(type) {
//         case "cat":
//           return new Cat();
//         case "dog":
//           return new Dog();
//         default:
//           throw "The '$type' is not an animal";
//       }
//     }
}

class Cat implements Animal { String makeNoise() => 'Meow'; }
class Dog implements Animal { String makeNoise() => 'Woef'; }