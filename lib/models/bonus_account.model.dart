class BonusAccount{

int _currentBonuses = 0;
int get currentBonuses => this._currentBonuses;

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