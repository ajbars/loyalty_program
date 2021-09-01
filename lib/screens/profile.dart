import 'package:bottombar/controller.dart';
import 'package:bottombar/models/dataStore.model.dart';
import 'package:bottombar/nav.dart';
import 'package:bottombar/screens/login.dart';
import 'package:flutter/material.dart';

Controller controller = Controller();

class Profile extends StatefulWidget {
  DataStore datastore;
  Profile({required this.datastore});
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
              trailing: Text("${client.email}"),
              leading: Icon(
                Icons.email_rounded,
                color: Colors.blue[500],
              ),
            ),
            Divider(),
            ListTile(
                title: Text("Имя: "),
                trailing: Text("${client.firstName}"),
                leading: Icon(Icons.person, color: Colors.blue[500])),
            Divider(),
            ListTile(
                title: Text("Oтчество: "),
                trailing: Text("${client.patronymic}"),
                leading: Icon(Icons.person, color: Colors.blue[500])),
            Divider(),
            ListTile(
                title: Text("Фамилия: "),
                trailing: Text("${client.lastName}"),
                leading: Icon(Icons.person, color: Colors.blue[500])),
            Divider(),
            //TODO date of birth
            ListTile(
              title: Text("Программа лояльности: "),
              trailing: TextButton(
                  child: Text("${loyalty.name}"),
                  onPressed: () {
                    setState(() {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => Nav(
                                selectedIndex: 1, datastore: datastore,
                              )));
                    });
                  }),
              leading: Icon(Icons.local_grocery_store_outlined,
                  color: Colors.blue[500]),
            ),
            Divider(),
            ListTile(
                title: Text("Телефон: "),
                trailing: Text("${client.phone}"),
                leading: Icon(Icons.phone, color: Colors.blue[500])),
            Divider(),
            ListTile(
                title: Text("Номер карты: "),
                trailing: Text("${client.cardNum}"),
                leading: Icon(Icons.credit_card, color: Colors.blue[500])),
            Divider(),
                        ListTile(
                title: Text("Дата рождения: "),
                trailing: Text("${client.birthDate.toString().substring(0,10)}"),
                leading: Icon(Icons.calendar_today, color: Colors.blue[500])),
            ListTile(
              title: Center(
                  child: TextButton(
                child: Text("Редактировать данные"),
                onPressed: () {},
              )),
            ),
          ],
        ),
      ),
    ));
  }
}
