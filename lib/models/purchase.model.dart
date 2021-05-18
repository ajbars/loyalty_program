class Purchase{

int _price;
DateTime buyDate;
String nameStore;
int paidByBonus;
int bonusRemainder;
int get price => this._price;

int bonusCount(int price){
  if (price < 500) {
    return (price / 10).round();
  }
  if (price < 1000) {
    return (price / 10).round() * 2;
  }
  else return (price / 10).round() * 3;
}

}