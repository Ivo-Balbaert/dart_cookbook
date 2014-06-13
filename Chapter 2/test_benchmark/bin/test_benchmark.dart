import 'package:benchmark_harness/benchmark_harness.dart';

class TemplateBenchmark extends BenchmarkBase {
  const TemplateBenchmark() : super("Template");

  static void main() {
    new TemplateBenchmark().report();
  }

  void run() {
     fib(20);
  }

// recursive algorithms:
//  int fib(int i) {
//    if (i < 2) return i;
//    return fib(i-1) + fib(i-2);
//  }

// int fib(n) => n<2 ? n : fib(n-2) + fib(n-1);

// iterative algorithm:
  int fib(int i){
    int a = 0; int b = 1;
    for (int n=a; n < b; n++) {
        a = a + b; b = a;
    }
    return a;
  }

void setup() { }
void teardown() { }
}

main() {
  TemplateBenchmark.main();
}
