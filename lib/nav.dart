import 'package:flutter/material.dart';

import 'home_screen.dart';

class Nav extends StatefulWidget {
  @override
  _NavState createState() => _NavState();
}

class _NavState extends State<Nav> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
Home(),
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