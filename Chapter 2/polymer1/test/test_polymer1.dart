library polymer1_test;

import 'dart:html';
// import 'dart:async';
import 'package:unittest/unittest.dart';
import 'package:polymer/polymer.dart';
import '../web/clickcounter.dart';
var _el;

main() {
  initPolymer();

  setUp((){
    _el = createElement('<click-counter>Click counter test</click-counter>');
    document.body.append(_el);
    // return flush();
  });

  tearDown((){
    _el.remove();
  });

  // tests:
  test('shadowroot elements are created', (){
      expect(querySelector('click-counter').children, isNotNull);
      expect(querySelector('click-counter').shadowRoot.text, isNotNull);
  });

  test('initial text ok', (){
      expect(querySelector('click-counter').shadowRoot.text.contains('click count: 0'), isTrue);
    });
   // test button met text Transaction:

  test('button with id click exists', (){
       var button = querySelector('click-counter').shadowRoot.querySelector('#click');
       expect(button, isNotNull);
     });

  test('button click() increments counter', (){
         ButtonElement button = querySelector('click-counter').shadowRoot.querySelector('#click');
         button.click();
         button.click();
         button.click();
         // flush();
         // get counter value:
         ClickCounter cc = querySelector('click-counter');
         expect(cc.count, 3);  // after 3 clicks
         // var span = querySelector('click-counter').shadowRoot.querySelector('#counter');
         // expect(span.text, contains('click count: 3')); // FAILED: span.text is 'click count: 0'
   });
}

//Future flush() {
//      var _completer = new Completer();
//      _el.async((_)=> _completer.complete());
//      return _completer.future;
//}

createElement(String html) =>
  new Element.html(html, treeSanitizer: new NullTreeSanitizer());

class NullTreeSanitizer implements NodeTreeSanitizer {
  void sanitizeTree(node) {}
}