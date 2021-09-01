class Purchase{

// int _price;
// DateTime buyDate;
// String nameStore;
// int paidByBonus;
// int bonusRemainder;

int _buySum;
int _bonusSpent;
int _level;
int _earnedBonus;
String _store;
DateTime _buyDateAndTime;



  Purchase(this._buySum, this._bonusSpent, this._level, this._earnedBonus, this._store, this._buyDateAndTime);
int get buySum => this._buySum;
int get bonusSpent => this._bonusSpent;
int get level => this._level;
int get earnedBonus => this._earnedBonus;
DateTime get buyDateAndTime => this._buyDateAndTime;

String get store => this._store;
}