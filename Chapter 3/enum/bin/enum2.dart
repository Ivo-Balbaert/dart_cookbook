import 'enum_abstract_class.dart';

class IssueDegree<String> extends Enum<String> {
   const IssueDegree(String val) : super (val);

   static const IssueDegree TRIVIAL = const IssueDegree('triv');
   static const IssueDegree REGULAR = const IssueDegree('reg');
   static const IssueDegree IMPORTANT = const IssueDegree('imp');
   static const IssueDegree CRITICAL = const IssueDegree('crit');
}


main() {
  assert(IssueDegree.REGULAR is IssueDegree);

  var issueLevel = IssueDegree.IMPORTANT;
     switch (issueLevel) {
       case IssueDegree.TRIVIAL:
         print("Ok, I'll sort it out during lunch");
         break;
       case IssueDegree.REGULAR:
         print("We'll assign it to Ellen, our programmer");
         break;
       case IssueDegree.IMPORTANT:
         print("Let's discuss it in a meeting tomorrow morning");
         break;
       case IssueDegree.CRITICAL:
         print('Warn the Boss!');
         break;
     }
}