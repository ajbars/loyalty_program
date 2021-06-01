import 'package:bottombar/controller.dart';
import 'package:bottombar/models/dataStore.model.dart';
import 'package:flutter/material.dart';

Controller controller = Controller();

class Cabinet extends StatefulWidget {
  DataStore datastore;
  Cabinet({this.datastore});
  @override
  _CabinetState createState() => _CabinetState();
}

class _CabinetState extends State<Cabinet> {
  @override
  Widget build(BuildContext context) {
  var client = datastore.myClient;
  var loyalty = datastore.loyaltyProgram;
    return Scaffold(
      body: Column(
        children: [
          Text(client.email),
          Text(client.lastName),
          Text(client.lastName),
          //TODO date of birth
          Text(loyalty.name),
          Text(client.phone)

        ],
      )
      
    );
  }
}