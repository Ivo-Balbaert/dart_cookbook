import 'dart:html';

void main() {
  print('PROD: ${const String.fromEnvironment('PROD')}');
  bool prod = const String.fromEnvironment('PROD') == 'true';
  if (prod) {
    // do production things
    window.alert("I am in Production!");
    connectDB(const String.fromEnvironment('DB'));
  }
  else {
    // do developer / test things
  }
  log('In production, I do not exist');
}

log(String msg) {
  if (const String.fromEnvironment('DEBUG') != null) {
    print('debug: $msg');
  }
}

connectDB(String con) {
  // open a database connection
}