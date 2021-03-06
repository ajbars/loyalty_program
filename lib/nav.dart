import 'package:bottombar/models/dataStore.model.dart';
import 'package:bottombar/qr.dart';
import 'package:bottombar/screens/login.dart';
import 'package:flutter/material.dart';

import 'screens/Profile.dart';
import 'screens/cabinet.dart';
class Nav extends StatefulWidget {
  final DataStore datastore;
  int selectedIndex;
  Nav({Key? key, required this.selectedIndex, required this.datastore});
  @override
  _NavState createState() => _NavState();
}

class _NavState extends State<Nav> {
  List<Widget> _widgetOptions = <Widget>[
Cabinet(ObjectKey(datastore), datastore),
QRCode(),
Profile(datastore: datastore),
  ];
  
  void _onItemTap(int index){
    setState(() {
      widget.selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text('Программа лояльности'),
      // ),
      body: Center(
        child: _widgetOptions.elementAt(widget.selectedIndex)
      )
      ,
      bottomNavigationBar: 
                BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Кабинет"),
            BottomNavigationBarItem(icon: Icon(Icons.qr_code), label: "QR-код"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Профиль")
          ],
          currentIndex: widget.selectedIndex,
          onTap: _onItemTap,
        )
      
    );
  }
}