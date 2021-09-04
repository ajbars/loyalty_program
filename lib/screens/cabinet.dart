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
  // final DateFormat formatter = DateFormat('yyyy-MM-dd hh:mm:ss');
    final DateFormat formatter = DateFormat('yyyy-MM-dd');


  Widget build(BuildContext context) {
    final purchaseHistory = datastore.bonusAccount.purchaseHistory;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Container(
            child: Table(children: [
          for (final row in purchaseHistory)
            (TableRow(children: [
              Text(formatter.format(row.buyDateAndTime), textScaleFactor: 0.6),
              Text(row.store.toString(), textScaleFactor: 0.6),
              Text(row.buySum.toString(), textScaleFactor: 0.6),
              Text(datastore.loyaltyProgram.name, textScaleFactor: 0.6),
              Text(row.bonusSpent.toString(), textScaleFactor: 0.6),
              Text(row.earnedBonus.toString(), textScaleFactor: 0.6),
              Text(row.level.toString(), textScaleFactor: 0.6),
            ]))
        ])),
      ),
    );
  }
}





// ListView.builder(
//   itemCount: purchaseHistory.length,
//   itemBuilder: (context, index) {
//         return Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: TableRow(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//             Text(purchaseHistory[index].buySum.toString()), Text(purchaseHistory[index].bonusSpent.toString()), Text(purchaseHistory[index].earnedBonus.toString()), Text(purchaseHistory[index].level.toString()), Text(purchaseHistory[index].store.toString()), Text(formatter.format(purchaseHistory[index].buyDateAndTime))]
//           ),
//         );
//   },
// )