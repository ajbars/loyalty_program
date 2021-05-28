import 'package:bottombar/models/purchase.model.dart';

class BonusAccount{

int _currentBonuses = 0;
List<Purchase> purchaseHistory = [];

BonusAccount(this._currentBonuses);

int get currentBonuses => this._currentBonuses;

setBonuses(int bonus) { 
      this._currentBonuses = bonus; 
   } 

}