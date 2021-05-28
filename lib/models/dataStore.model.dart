// модель файла, хранящего данные
// в нем внутри есть: 
// структура "Клиент" с его данными
// структура "Программа лояльности" с ее описанием
// структура "Бонусный счет" с историей и состоянием счета бонусов.

// в начале контроллер записывает эти данные в бд - хардкодит их
// потом при создании объекта дата стор создаются объекты на основе бд и пишутся в него - это делает контроллер 

import 'package:bottombar/models/client.model.dart';
import 'package:bottombar/models/loyalty_program.model.dart';

import 'bonus_account.model.dart';

class DataStore {
  Client _myClient;
  LoyaltyProgram _loyaltyProgram;
  BonusAccount _bonusAccount;
  DataStore(this._myClient, this._loyaltyProgram, this._bonusAccount);

  Client get myClient => _myClient;
  LoyaltyProgram get loyaltyProgram => _loyaltyProgram;
  BonusAccount get bonusAccount => _bonusAccount;
   } 


