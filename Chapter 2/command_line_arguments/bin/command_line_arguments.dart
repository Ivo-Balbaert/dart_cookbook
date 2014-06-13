import 'package:args/args.dart';

ArgResults argResults;

void main(List<String> args) {
  print("script arguments:");
  for(String arg in args)
    print(arg);
  // parsing key:value pairs:
  for(String arg in args) {
    List<String> par = arg.split(':');
    var key = par[0];
    var value = par[1];
    print('Key is: $key - Value is: $value');
  }
  // using args:
  final parser = new ArgParser();
  argResults = parser.parse(args);
  List<String> pars = argResults.rest;
  print(pars); // [par1:value1, par2:value2, par3:value3]
  for(String par in pars) {
    List<String> p = par.split(':');
    var key = p[0];
    var value = p[1];
    print('Key is: $key - Value is: $value');
  }
}
