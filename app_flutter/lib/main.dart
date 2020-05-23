import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App HP',
      home: Scaffold(
        appBar: AppBar(
          title: Text('My App HP'),
        ),
        // body: Image.network(
        //   'https://picsum.photos/250?image=9',
        // ),
        body: Center(
          child: Container(
            width: 380,
            height: 800,
            color: Colors.red,
            // child: Image.asset(
            child: Image.network(
              // 'assets/fondo.png',
              'https://i.imgur.com/xTr1BrW.png',
              fit: BoxFit.scaleDown,
              scale: 1,
              repeat: ImageRepeat.repeatY,
            ),
          ),
        ),
      ),
    );
  }
}
