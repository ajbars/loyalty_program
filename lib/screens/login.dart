import 'dart:html';

import 'package:bottombar/controller.dart';
import 'package:bottombar/models/dataStore.model.dart';
import 'package:bottombar/screens/sign_up.dart';
import 'package:flutter/material.dart';


import 'package:fluttertoast/fluttertoast.dart';

import '../nav.dart';

Controller controller = Controller();
DataStore datastore = controller.createDataStoreMock();
final login = TextEditingController();
final password = TextEditingController();


class LogIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var gadgetSize = MediaQuery.of(context).size;
    return Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: gadgetSize.width * 0.3),
            child: Center(
              child: Column(
                children: [
                 SizedBox(height: 200),
                 TextField(controller: login,
                 decoration: InputDecoration(
                   labelText: "e-mail"
                 ),),
                 TextField(controller: password, 
                 obscureText: true,
                 decoration: InputDecoration(
                   labelText: "пароль"
                 )),
                 Padding(
                   padding: const EdgeInsets.only(top: 30.0),
                   child: SizedBox(
                     width: 100.0,
                     child: ElevatedButton(
                       onPressed: (){
String answer = controller.login(login.text, password.text, datastore);
if (answer == "bad email"){
   Fluttertoast.showToast(
          msg: 'Неправильный e-mail',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          webPosition: "center");
} else if (answer == "bad password"){
Fluttertoast.showToast(
          msg: 'Неправильный пароль',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          webPosition: "center");
} else {
Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Nav()),
  );}
                     }, 
                     child: Text("Вход")),
                   ),
                 ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: SizedBox(
                    width: 100.0,
                    child: ElevatedButton(
                      child: Text("Регистрация"),
                      onPressed: (){
                      Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => SignUp(datastore: datastore))
  );}),
                  ),
                ) 
],

        
      ),
            ),
          ),
    );
  }
}