class Controller{
// data struct check or createlogin method
// sign up method
// read history method
// read program terms method
// add purchase method
// count bonuses



login(){
// request whether there is a client with that email, if not suggest signing up
// if yes, check password. if wrong, show alert / toast
}



signup(){
  // create a client entity in the database with the given email and password pair,
  // this should be somehow encrypted probably
}

//Create hardcoded data entries in the database
createHardcodeData(){

}

//Create a single object holding data for the application
checkCreateDataStore(){
  // createDataStore

  // create Client object from db

  // create LoyaltyProgram object from db

  // create BonusAccount object from db
}



void newPurchase(){}




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
