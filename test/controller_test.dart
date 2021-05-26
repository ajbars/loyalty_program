import 'package:bottombar/controller.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('bonus count function', () {
  var controller = Controller();

//level one of program returns 1/10 as bonuses
expect(controller.bonusCount(100), 10);
expect(controller.bonusCount(200), 20);
expect(controller.bonusCount(310), 31);
//level 2 of program returns double bonuses
expect(controller.bonusCount(510), 102);
//level 3 of program returns triple bonuses
expect(controller.bonusCount(1000), 300);



var purchase = controller.newPurchase(3, 200);



});






}

