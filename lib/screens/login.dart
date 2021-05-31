import 'dart:html';

import 'package:bottombar/controller.dart';
import 'package:bottombar/models/dataStore.model.dart';
import 'package:flutter/material.dart';
Controller controller = Controller();
DataStore datastore = controller.createDataStoreMock();
class LogIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: ListView(
            children: [
             SizedBox(height: 50),
             Text("Электрический почтамт"),
             TextField(),
             Text("Тайное словесо"),
             TextField(keyboardType: ,),
             TextButton(onPressed: (){

             }, child: Text("Отправити"))

            ],

        
      ),
    );
  }
}