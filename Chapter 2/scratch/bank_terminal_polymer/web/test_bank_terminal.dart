library bank_terminal_test;

import 'package:unittest/unittest.dart';
import 'dart:html';
import 'package:polymer/polymer.dart';
import 'package:bank_terminal/bank_terminal.dart';

main() {
  initPolymer();
  var _el;

  setUp((){
  _el = createElement(' <bank-app>Bank App Test</bank-app>');
    document.body.append(_el);
  });

  tearDown((){
  _el.remove();
  });

  // tests:
   test('shadowroot elements are created', (){
      expect(querySelector('bank-app').children, isNotNull);
      expect(querySelector('bank-app').shadowRoot.text, isNotNull);
  });
   // test button met text Transaction:
  test('test 2', (){
        // expect(querySelector('bank-app').shadowRoot.text, contains('Transaction'));
        print(querySelector('bank-app').shadowRoot.text);
        // expect(querySelector('bank-app').shadowRoot.children.last,
        //    equals(new isInstanceOf<BankAccount>()));
        //Node n = querySelector('bank-app').shadowRoot.children.
        //expect(querySelector('bank-app').shadowRoot.children.last.contains(<bank-account>),
        //            equals('BankAccount:<bank-account>'));
        expect(querySelector('bank-account').shadowRoot.children, isNotNull);
        //expect(querySelector('bank-app').shadowRoot.children
    });

}

createElement(String html) =>
  new Element.html(html, treeSanitizer: new NullTreeSanitizer());

class NullTreeSanitizer implements NodeTreeSanitizer {
  void sanitizeTree(node) {}
}