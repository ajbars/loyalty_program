import 'package:bottombar/models/dataStore.model.dart';
import 'package:bottombar/screens/login.dart';
import 'package:flutter/material.dart';

import 'screens/cabinet.dart';

class Nav extends StatefulWidget {
  DataStore datastore;
  int selectedIndex;
  Nav({Key key, this.selectedIndex, this.datastore}) : super(key: key);
  @override
  _NavState createState() => _NavState();
}

class _NavState extends State<Nav> {
  List<Widget> _widgetOptions = <Widget>[
Cabinet(datastore: datastore),
Text('Messages'),
Text('Profile')
  ];
  
  void _onItemTap(int index){
    setState(() {
      widget.selectedIndex = index;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Программа лояльности'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(widget.selectedIndex)
      )
      ,
      bottomNavigationBar: 
                BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Кабинет"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Программа")
          ],
          currentIndex: widget.selectedIndex,
          onTap: _onItemTap,
        )
      
    );
  }
}