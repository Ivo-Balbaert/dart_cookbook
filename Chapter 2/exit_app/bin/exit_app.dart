import 'dart:io';

void main() {
  exitCode = 0; // presume success
  var message = "Dart is fun!";
  int i = 0;
  while (true) {
    print(message);
    i++;
    if (i == 10) {
      print("That's enough!");
      // exit(10);
      exitCode = 10;
      // … other code can be executed
      exit(exitCode);
    }
  }
}
