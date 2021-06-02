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
    var client = widget.datastore.myClient;
    var loyalty = widget.datastore.loyaltyProgram;
    return Scaffold(
        body: Center(
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // SizedBox(height:30),
            ListTile(
              title: Text("E-mail:"),
              subtitle: Text("${client.email}"),
              leading: Icon(
                Icons.email_rounded,
                color: Colors.blue[500],
              ),
            ),
            Divider(),
            ListTile(title: Text("Имя: "), subtitle: Text("${client.firstName}"), leading: Icon(Icons.person, color: Colors.blue[500])),
            Divider(),
            ListTile(title: Text("Oтчество: "), subtitle: Text("${client.patronymic}"), leading: Icon(Icons.person, color: Colors.blue[500])),
            Divider(),
            ListTile(title: Text("Фамилия: "), subtitle: Text("${client.lastName}"),leading: Icon(Icons.person, color: Colors.blue[500])),
            Divider(),
            //TODO date of birth
            ListTile(title: Text("Программа лояльности: "), subtitle: Text("${loyalty.name}"), leading: Icon(Icons.local_grocery_store_outlined, color: Colors.blue[500]),),
            Divider(),
            ListTile(title: Text("Телефон: "), subtitle: Text("${client.phone}"), leading: Icon(Icons.phone, color: Colors.blue[500])),
            Divider(),
            ListTile(title: Text("Номер карты: "), subtitle: Text("${client.cardNum}"), leading: Icon(Icons.credit_card),),
          ],
        ),
      ),
    ));
  }
}
