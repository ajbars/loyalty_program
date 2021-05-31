import 'dart:math';
import 'package:bottombar/models/bonus_account.model.dart';
import 'package:bottombar/models/loyalty_program.model.dart';
import 'models/client.model.dart';
import 'models/dataStore.model.dart';
import 'models/purchase.model.dart';



var datastore;

class Controller{
// data struct check or createlogin method
// sign up method
// read history method
// read program terms method
// add purchase method
// count bonuses


login(String email, String password){
// request whether there is a client with that email, if not suggest signing up
// if yes, check password. if wrong, show alert / toast

//Look for this email in db
//if not, show toast 'email not in db please register'
//Check whether password is correct for this email
//if not, show toast 'wrong password'
//if yes, Navigator to Cabinet screen
}



signUp(email, firstName, lastName, patronymic, phone, datastore){
  // create a client entity in the database with the given email and password pair,
  // this should be somehow encrypted probably
Client newClient = Client(email: email, firstName: firstName, lastName: lastName, patronymic: patronymic, phone: phone);
print (datastore.myClient.lastName);
datastore.setClient(newClient);
}


//Create a single object holding data for the application
// createDataStore(){
//   // create Client object from db
// Client myClient = Client();
//   // create LoyaltyProgram object from db
// LoyaltyProgram loyaltyProgram = LoyaltyProgram();
//   // create BonusAccount object from db
// BonusAccount bonusAccount = BonusAccount(); 
//   // createDataStore
// DataStore datastore = DataStore(myClient, loyaltyProgram, bonusAccount);
// }


// MOCKUP BEFORE THE ACTUAL DB IS CONNECTED
createDataStoreMock(){
  // create Client object from db
  String firstName="Ivan";
  String lastName = "Solzhenitzyn";
  String patronymic = "Ivanovich";
  String phone = "223322";
  String email = "ivo@solzhenitzyn@gmail.com";

Client myClient = Client(email: email, firstName: firstName, lastName: lastName, patronymic: patronymic, phone: phone);
  // create LoyaltyProgram object from db
  String name = "Бодрый кролик";
  String description = "Вы присоединяетесь к программе, устанавливая приложение и создавая учетную запись.\n При покупке в данном магазине 1 бонус равен 1 рублю.\nБонусы используются при каждой покупке\n(1) на каждые потраченные 10 рублей вы получаете 1 бонус, до 500 рублей\n(2)при покупке от 500 рублей за каждые 10 рублей добавляются 2 бонуса\n (3) при покупке от 1000 рублей за каждые 10 рублей добавляются 3 бонуса\n Все операции программы лояльности производятся только в приложении.";
LoyaltyProgram loyaltyProgram = LoyaltyProgram(name, description);
  // create BonusAccount object from db
BonusAccount bonusAccount = BonusAccount(0); 
  // createDataStore
DataStore datastore = DataStore(myClient, loyaltyProgram, bonusAccount);
return datastore;
}


//newPurchase writes history of purchase, runs bonusCount, updates the bonus account and returns a success message
newPurchase(DataStore datastore, int level){
  Random random = new Random();
  int buySum;
  int bonusSpent;
  
// generate a random index based on the list length
// and use it to retrieve the element
var listStores = ['Мишка','Зайчик','Белочка'];
var store = listStores[random.nextInt(listStores.length)];
 

 // Generates a random purchase amount with random bonuses spent amount 
switch (level){
  case 1: {
    buySum = random.nextInt(500) + 1; // from 1 to 499
    bonusSpent = random.nextInt(50); 
    dbUpdate(datastore, bonusSpent, buySum, level, store);
  }
  break;

  case 2:{
    buySum = random.nextInt(500) + 500; // from 500 to 999 included
    bonusSpent = random.nextInt(100); 
    dbUpdate(datastore, bonusSpent, buySum, level, store);
  }
  break;

  case 3:{
    buySum = random.nextInt(9000) + 1000; // from  1000 to 9999 included
    bonusSpent = random.nextInt(200); 
    dbUpdate(datastore, bonusSpent, buySum, level, store);
  }
  break;
}
}

// Adds the new purchase to db
void dbUpdate(DataStore datastore, int bonusSpent, int buySum, int level, String store){
      if (datastore.bonusAccount.currentBonuses < bonusSpent) { // If 'bonuses spent' random number is bigger than current bonuses in the account
        bonusSpent = datastore.bonusAccount.currentBonuses;
        datastore.bonusAccount.setBonuses(0);
         } 
         else {
           int x = datastore.bonusAccount.currentBonuses - bonusSpent;
        datastore.bonusAccount.setBonuses(x);
         }
    int earnedBonus = bonusCount(buySum);
    // Adding earned bonuses to the account
    int y = datastore.bonusAccount.currentBonuses + earnedBonus;
    datastore.bonusAccount.setBonuses(y); 
    Purchase purchase = Purchase(buySum, bonusSpent, level, earnedBonus, store); 
    datastore.bonusAccount.purchaseHistory.add(purchase);
    // TODO return success message
}

// counts bonuses based on the price of buy
int bonusCount(int price){
  if (price < 500) {
    return (price / 10).round();
  }
  if (price < 1000) {
    return (price / 10).round() * 2;
  }
  else return (price / 10).round() * 3;
}


List readHistory(datastore){
  //read datastore, return list of entries
return datastore.bonusAccount.purchaseHistory;
}


Map<String, String> programTerms(datastore){
//read datastore, return name and description
Map<String, String> loyaltyTerms = {
  "name": datastore.loyaltyProgram.name,
  "desc": datastore.loyaltyProgram.description,
};
return loyaltyTerms;
}

}