class BonusAccount{

int _currentBonuses = 0;

BonusAccount(this._currentBonuses);

int get currentBonuses => this._currentBonuses;

set setBonuses(int bonus) { 
      this._currentBonuses = bonus; 
   } 

}