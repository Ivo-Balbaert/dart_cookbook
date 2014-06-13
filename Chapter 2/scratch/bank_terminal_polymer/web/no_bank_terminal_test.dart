//library harness_browser;

import 'package:unittest/html_enhanced_config.dart';
import 'package:unittest/unittest.dart';
import 'dart:html';
import 'bank_app.dart' as app;

main() {
  useHtmlEnhancedConfiguration();
  var ba = new app.BankApp.created();
  // saldo is 1500
  // na storting van 150: saldo is 1650
  // na withdraw van 250: saldo is 1400
  var sample_text = querySelector("#sample_text_id");
  test('text says Click Me!', (){
    expect(sample_text.text, equals('Click me!'));
  });

  test('text says !em kcilC!', (){
    sample_text.click();
    expect(sample_text.text, equals('!em kcilC'));
  });
}