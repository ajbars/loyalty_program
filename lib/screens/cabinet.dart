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
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
              width: MediaQuery.of(context).size.width * 2,
              child: Table(children: [
                TableRow(children: [
                  Text("Дата покупки"),
                  Text("Магазин"),
                  Text("Сумма покупки"),
                  Text("Программа лояльности"),
                  Text("Потрачено бонусов"),
                  Text("Получено бонусов"),
                  Text("Уровень программы"),
                ]),
                for (final row in purchaseHistory)
                  (TableRow(

                    children: [
                    TableCell(
                      child: Text(formatter.format(row.buyDateAndTime)),
                    ),
                    TableCell(child: Text(row.store.toString())),
                    TableCell(child: Text(row.buySum.toString())),
                    TableCell(child: Text(datastore.loyaltyProgram.name)),
                    TableCell(child: Text(row.bonusSpent.toString())),
                    TableCell(child: Text(row.earnedBonus.toString())),
                    TableCell(child: Text(row.level.toString())),
                  ]))
              ])),
        ),
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