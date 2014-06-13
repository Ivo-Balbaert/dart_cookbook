import 'enum_abstract_class.dart';

const IssueDegree TRIVIAL = const IssueDegree('triv');
const IssueDegree REGULAR = const IssueDegree('reg');
const IssueDegree IMPORTANT = const IssueDegree('imp');
const IssueDegree CRITICAL = const IssueDegree('crit');

class IssueDegree<String> extends Enum<String> {
   const IssueDegree(String val) : super (val);
}

main() {
  assert(REGULAR is IssueDegree);

  var issueLevel = IMPORTANT;
     switch (issueLevel) {
       case TRIVIAL:
         print("Ok, I'll sort it out during lunch");
         break;
       case REGULAR:
         print("We'll assign it to Ellen, our programmer");
         break;
       case IMPORTANT:
         print("Let's discuss it in a meeting tomorrow morning");
         break;
       case CRITICAL:
         print('Warn the Boss!');
         break;
     }
}