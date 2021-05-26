import 'dart:math';
import 'package:bottombar/models/bonus_account.model.dart';
import 'package:bottombar/models/loyalty_program.model.dart';
import 'models/client.model.dart';
import 'models/dataStore.model.dart';
import 'models/purchase.model.dart';

class Controller{
// data struct check or createlogin method
// sign up method
// read history method
// read program terms method
// add purchase method
// count bonuses

var datastore;


login(String email, String password){
// request whether there is a client with that email, if not suggest signing up
// if yes, check password. if wrong, show alert / toast

//Look for this email in db
//if not, show toast 'email not in db please register'
//Check whether password is correct for this email
//if not, show toast 'wrong password'
//if yes, Navigator to Cabinet screen
}



signup(){
  // create a client entity in the database with the given email and password pair,
  // this should be somehow encrypted probably
}


//Create a single object holding data for the application
createDataStore(){
  // create Client object from db
var myClient = Client();
  // create LoyaltyProgram object from db
var loyaltyProgram = LoyaltyProgram();
  // create BonusAccount object from db
var bonusAccount = BonusAccount(); 
  // createDataStore
return datastore = DataStore(myClient, loyaltyProgram, bonusAccount);
}


// MOCKUP BEFORE THE ACTUAL DB IS CONNECTED
createDataStoreMock(){
  // create Client object from db
var myClient = Client();
  // create LoyaltyProgram object from db
var loyaltyProgram = LoyaltyProgram();
  // create BonusAccount object from db
var bonusAccount = BonusAccount(); 
  // createDataStore
return datastore = DataStore(myClient, loyaltyProgram, bonusAccount);
}


//newPurchase writes history of purchase, runs bonusCount, updates the bonus account and returns a success message
newPurchase(int level, int currentBonus){
  Random random = new Random();
  int buySum;
  int bonusSpent;
  int bonusAdded; // WHY?
  
 // Generates a random purchase amount with random bonuses spent amount 
switch (level){
  case 1: {
    buySum = random.nextInt(500); // from 0 to 500 included
    bonusSpent = random.nextInt(50); 
    dbUpdate(currentBonus, bonusSpent, buySum);
  }
  break;

  case 2:{
    buySum = random.nextInt(500) + 500; // from 500 to 999 included
    bonusSpent = random.nextInt(100); 
    dbUpdate(currentBonus, bonusSpent, buySum);

  }
  break;

  case 3:{
    buySum = random.nextInt(10000) + 1000; // from  1000 to 11000 included
    bonusSpent = random.nextInt(200); 
    dbUpdate(currentBonus, bonusSpent, buySum);
  }
  break;
}
}

// adds the new purchase to db
void dbUpdate(int currentBonus, int bonusSpent, int buySum){
      if (currentBonus < bonusSpent) bonusSpent = currentBonus; // If 'bonuses spent' random number is bigger than current bonuses in the account
    datastore.currentBonus = 0;
    datastore.currentBonus += bonusCount(buySum); // Adding earned bonuses to the account
    var purchase = Purchase(buySum, bonusSpent); // TODO Add name of store, level of purchases and the earned bonus
    datastore.purchaseHistory.add(purchase);
    // TODO return success message
}


int bonusCount(int price){
  if (price < 500) {
    return (price / 10).round();
  }
  if (price < 1000) {
    return (price / 10).round() * 2;
  }
  else return (price / 10).round() * 3;
}


List readHistory(){
  //read datastore, return list of entries
}



List programTerms(){}
//read datastore, return name and description

}

