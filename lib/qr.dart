import 'package:flutter/material.dart';

class QRCode extends StatelessWidget {
  const QRCode({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset("lib/assets/img/qrcode.png", scale: 0.2)
    );
    
    
    
    // Container(child: 
    //   Center(child: Image.asset("img/qrcode.jpg")),
    // );
  }
}