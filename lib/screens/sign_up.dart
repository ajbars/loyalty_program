import "dart:async";
import 'package:bottombar/models/dataStore.model.dart';
import 'package:bottombar/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../controller.dart';
import '../nav.dart';

Controller controller = Controller();
final emailStr = TextEditingController();
final password = TextEditingController();
final password2 = TextEditingController();
final nameStr = TextEditingController();
final lastNameStr = TextEditingController();
final patronymicStr = TextEditingController();
final telNumStr = TextEditingController();

class SignUp extends StatefulWidget {
  DataStore datastore;
  SignUp({this.datastore});
  @override
  _SignUpState createState() => _SignUpState();
}



class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    var gadgetSize = MediaQuery.of(context).size;
    return Scaffold(
          body: Material(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: gadgetSize.width * 0.3),
          child: Column(
            children: [
              SizedBox(height: 200),
                     TextField(controller: emailStr,
                     decoration: InputDecoration(
                       labelText: "e-mail"
                     ),),
                     // TODO make an email validation
                     TextField(controller: password, 
                     obscureText: true,
                     decoration: InputDecoration(
                       labelText: "Пароль"
                     )),
                     TextField(controller: password2, 
                     obscureText: true,
                     decoration: InputDecoration(
                       labelText: "Пароль повторно"
                     )),
                     // TODO check if passwords are identical
                     TextField(controller: nameStr, 
                     decoration: InputDecoration(
                       labelText: "Имя"
                     )),
                      TextField(controller: lastNameStr, 
                     decoration: InputDecoration(
                       labelText: "Фамилия"
                     )),
                     TextField(controller: patronymicStr, 
                     decoration: InputDecoration(
                       labelText: "Отчество"
                     )),
                     TextField(controller: telNumStr, 
                     decoration: InputDecoration(
                       labelText: "Номер телефона"
                     )),
                     Padding(
                       padding: const EdgeInsets.only(top: 30.0),
                       child: SizedBox(
                         width: 100.0,
                         child: ElevatedButton(
                           onPressed: (){
                             print(nameStr);
                             print(password);
                             print(password2);
                             bool signUpSuccess = controller.signUp(emailStr.text, nameStr.text, lastNameStr.text, patronymicStr.text, telNumStr.text, password.text, password2.text, datastore);
                             if (signUpSuccess == true) {
Fluttertoast.showToast(
          msg: 'Вы успешно зарегистрировались!',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          webPosition: "center");
Timer(Duration(seconds: 2), () {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Nav())
);
});
                             } else {
                               Fluttertoast.showToast(
          msg: 'Введенные пароли не совпадают!',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          webPosition: "center");
                             }
                           }, 
                         child: Text("Регистрация")),
                       ),
                     ),
            ],

            
          ),
        ),
      ),
    );
  }
}