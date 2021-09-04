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

  // final DateFormat formatter = DateFormat('yyyy-MM-dd hh:mm:ss');
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  
  @override
  Widget build(BuildContext context) {
    final purchaseHistory = datastore.bonusAccount.purchaseHistory;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
              width: MediaQuery.of(context).size.width * 2,
              child: Table(
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                border: TableBorder.all(width: 2, color: Colors.blue),
                children: [
                TableRow(children: [
                  SizedBox(
                    height: 60,
                    child: Center(child: Text("Дата покупки"))),
                  Center(child: Text("Магазин")),
                  Center(child: Text("Сумма покупки")),
                  Center(child: Text("Программа")),
                  Center(child: Text("Потрачено бонусов")),
                  Center(child: Text("Получено бонусов")),
                  Center(child: Text("Уровень программы ")),
                ]),
                for (final row in purchaseHistory)
                  (TableRow(

                    children: [
                    TableCell(
                      child: SizedBox(
                        height: 60,
                        child: Center(child: Text(formatter.format(row.buyDateAndTime)))),
                    ),
                    TableCell(child: Center(child: Text(row.store.toString()))),
                    TableCell(child: Center(child: Text(row.buySum.toString()))),
                    TableCell(child: Center(child: Text(datastore.loyaltyProgram.name))),
                    TableCell(child: Center(child: Text(row.bonusSpent.toString()))),
                    TableCell(child: Center(child: Text(row.earnedBonus.toString()))),
                    TableCell(child: Center(child: Text(row.level.toString()))),
                  ]))
              ])),
        ),
      ),
    );
  }
}

