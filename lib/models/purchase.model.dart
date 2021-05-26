class Purchase{

int _price;
DateTime buyDate;
String nameStore;
int paidByBonus;
int bonusRemainder;

  Purchase(int buySum, int bonusSpent, int level, int earnedBonus, String store);
int get price => this._price;



}