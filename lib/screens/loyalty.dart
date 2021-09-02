import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:bottombar/models/dataStore.model.dart';
import 'package:bottombar/screens/login.dart';

class Cabinet extends StatelessWidget {
  DataStore datastore;
  Cabinet(
    Key? key,
    this.datastore,
  ) : super(key: key);


  @override

  final DateFormat formatter = DateFormat('yyyy-MM-dd hh:mm:ss');

  Widget build(BuildContext context) {
    final purchaseHistory = datastore.bonusAccount.purchaseHistory;
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Container(child:
ListView.builder(
  itemCount: purchaseHistory.length,
  itemBuilder: (context, index) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
          Text(purchaseHistory[index].buySum.toString()), Text(purchaseHistory[index].bonusSpent.toString()), Text(purchaseHistory[index].earnedBonus.toString()), Text(purchaseHistory[index].level.toString()), Text(purchaseHistory[index].store.toString()), Text(formatter.format(purchaseHistory[index].buyDateAndTime))]
        ),
      );
  },
)

      ),
    );
  }
}

