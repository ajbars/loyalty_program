import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: 
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: 
      const <Widget> [ 
        Text('Кабинет'),
        Text('Программа лояльности Дерзкий Зайчик'),
        Text('Список покупок'),
      ]
      )
    );
  }
}