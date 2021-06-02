import 'package:bottombar/models/dataStore.model.dart';
import 'package:bottombar/screens/login.dart';
import 'package:flutter/material.dart';

import 'screens/cabinet.dart';

class Nav extends StatefulWidget {
  DataStore datastore;
  Nav({Key key, this.datastore}) : super(key: key);
  @override
  _NavState createState() => _NavState();
}

class _NavState extends State<Nav> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
Cabinet(datastore: datastore),
Text('Messages'),
Text('Profile')
  ];
  
  void _onItemTap(int index){
    setState(() {
      _selectedIndex = index;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bottom Nav Bar'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex)
      )
      ,
      bottomNavigationBar: 
                BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Left"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Right")
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTap,
        )
      
    );
  }
}