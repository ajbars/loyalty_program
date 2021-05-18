class LoyaltyProgram{

String _description = 'Momofoko';
String get description => this._description;

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