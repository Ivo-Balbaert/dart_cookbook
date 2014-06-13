import 'package:microtest/microtest.dart';

void main() {
 Person p1 = new Person("Jim Greenfield", 178, 86.0);
 print('${p1.name} weighs ${p1.weight}' );
 // lots of other code and method calls
 p1 = null;
 // working again with p1:
 assert(p1 is Person); // Failed assertion: line 9 pos 9: 'p1 is Person' is not true.
 // if (p1 is Person) {
 p1.weight = 100.0;
 // }
 print('${p1.name} now weighs ${p1.weight}' );
}
