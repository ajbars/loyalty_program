import 'package:bottombar/controller.dart';
import 'package:bottombar/models/dataStore.model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('bonus count function', () {
  final Controller controller = Controller();

//level one of program returns 1/10 as bonuses
expect(controller.bonusCount(100), 10);
expect(controller.bonusCount(200), 20);
expect(controller.bonusCount(310), 31);
//level 2 of program returns double bonuses
expect(controller.bonusCount(510), 102);
//level 3 of program returns triple bonuses
expect(controller.bonusCount(1000), 300);
});

test('creating mock database', () 
{
final Controller controller = Controller();
DataStore datastore = controller.createDataStoreMock();
expect(datastore.myClient.name, "Ivan");
expect(datastore.myClient.patronymic, "Ivanovich");
expect(datastore.loyaltyProgram.name, 'Бодрый кролик');
expect(datastore.bonusAccount.currentBonuses, 0);
});


test('adding random purchase', () 
{
final Controller controller = Controller();
DataStore datastore = controller.createDataStoreMock();

// Testing 3 levels of a loyalty program
controller.newPurchase(datastore, 1);
expect(datastore.bonusAccount.currentBonuses > 0 && datastore.bonusAccount.currentBonuses < 100, true);
print(datastore.bonusAccount.currentBonuses);
controller.newPurchase(datastore, 2);
print(datastore.bonusAccount.currentBonuses);
expect(datastore.bonusAccount.currentBonuses > 100, true);
controller.newPurchase(datastore, 3);
print(datastore.bonusAccount.currentBonuses);
expect(datastore.bonusAccount.currentBonuses > 100, true);

});



test('testing dbUpdate for creating a purchase object in purchaseHistory', () {
final Controller controller = Controller();
DataStore datastore = controller.createDataStoreMock();
// void dbUpdate(DataStore datastore, int bonusSpent, int buySum, int level, String store)
controller.dbUpdate(datastore, 10, 1000, 3, "Snusmumrik");
expect(datastore.bonusAccount.purchaseHistory.length > 0, true);
expect(datastore.bonusAccount.purchaseHistory[0].bonusSpent, 0);
expect(datastore.bonusAccount.purchaseHistory[0].buySum, 1000);
expect(datastore.bonusAccount.purchaseHistory[0].earnedBonus, 300);
expect(datastore.bonusAccount.purchaseHistory[0].level, 3);
expect(datastore.bonusAccount.purchaseHistory[0].store, 'Snusmumrik');
});


}
