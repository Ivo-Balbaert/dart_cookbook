import 'dart:async';

void main() {
  // Examples working with futures:
  // 1) chaining futures:
  firstStep()
    .then(secondStep)
    .then(thirdStep)
    .then(fourthStep)
    .catchError(handleError);
  // 2) concurrent Futures:
  List futs = [firstStep, secondStep, thirdStep, fourthStep];
  Future.wait(futs)
    .then((List<T> val) => processValues(val))
    .catchError(handleError);
  // 3) catching specific errors:
  firstStep()
      .then(secondStep)
      .catchError(handleArgumentError,
                  test: (e) => e is ArgumentError)
      .catchError(handleFormatException,
                  test: (e) => e is FormatException)
      .catchError(handleRangeError,
                  test: (e) => e is RangeError)
      .catchError(handleException, test: (e) => e is Exception);
  // 4) whenComplete:
  firstStep()
      .then(secondStep)
      .catchError(handleError)
      .whenComplete(cleanUp);
  // 5) Handling synchronous and asynchronous errors:
  var data;
  mixedFunction(data).catchError(handleError);
}

firstStep() {}
T secondStep() {}
T thirdStep() {}
T fourthStep() {}
T finalStep() {}
handleError() {}
processValues(val) {}
handleArgumentError() {}
handleFormatException() {}
handleRangeError() {}
handleException() {}
cleanUp() {}
processResult() {}

class T {}

// wrong version:
//mixedFunction(data) {
//  var var1 = synFunc(data);         // Could throw error.
//  return var1.asynFunc().then(processResult);  // Could throw error.
//}

// correct version:
mixedFunction(data) {
  return new Future.sync(() {
    var var1 = synFunc(data);         // Could throw error.
    return var1.asynFunc().then(processResult);  // Could throw error.
  });
}

//
synFunc(data) {}
asynFunc() {}
