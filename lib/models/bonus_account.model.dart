import 'package:bottombar/models/purchase.model.dart';

class BonusAccount{

int _currentBonuses = 0;
List<Purchase> _purchaseHistory;

BonusAccount(this._currentBonuses, this._purchaseHistory);

int get currentBonuses => this._currentBonuses;
List<Purchase> get purchaseHistory => this._purchaseHistory;


setBonuses(int bonus) { 
      this._currentBonuses = bonus; 
   } 

}