import 'dart:html';
import 'package:polymer/polymer.dart';
import 'package:logging/logging.dart';

final Logger log = new Logger('Bank Account');

@CustomTag('bank-account')
class BankAccount extends PolymerElement {
  @published var bac;
  @published double balance;
  double amount = 0.0;

  BankAccount.created() : super.created() {
    setupLogger();
    log.info('Bank Account component is created');
  }

  enteredView() {
    super.enteredView();
    balance = bac.balance;
  }

  setupLogger() {
    // Set up logger.
     Logger.root.level = Level.ALL;
     Logger.root.onRecord.listen((LogRecord rec) {
       print('${rec.level.name}: ${rec.time}: ${rec.message}');
     });
  }

  transact(Event e, var detail, Node target) {
    InputElement amountInput = shadowRoot.querySelector("#amount");
    if (!checkAmount(amountInput.value)) return;
    bac.transact(amount);
    balance = bac.balance;
  }

  enter(KeyboardEvent  e, var detail, Node target) {
    if (e.keyCode == KeyCode.ENTER) {
      transact(e, detail, target);
    }
  }

  checkAmount(String in_amount) {
    try {
      amount = double.parse(in_amount);
    } on FormatException catch(ex) {
      log.warning("Amount $in_amount is not a double!");
      return false;
    }
    return true;
  }
}