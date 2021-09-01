import 'package:flutter/material.dart';

import 'package:bottombar/models/dataStore.model.dart';
import 'package:bottombar/screens/login.dart';

class Cabinet extends StatelessWidget {
  DataStore datastore;
  Cabinet(
    Key? key,
    this.datastore,
  ) : super(key: key);


final purchaseHistory = datastore.bonusAccount.purchaseHistory;



  @override
  Widget build(BuildContext context) {
    return Container(child:
ListView.builder(
  itemCount: purchaseHistory.length,
  itemBuilder: (context, index) {
    return ListTile(
      title: Text(purchaseHistory[index].toString()),
    );
  },
)

    );
  }
}

