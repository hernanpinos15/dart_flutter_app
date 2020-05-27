import 'package:app_flutter/screens/authenticate/sign_in.dart';
import 'package:app_flutter/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:app_flutter/screens/home/home_page.dart';
import 'package:app_flutter/screens/authenticate/register.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/loading': (BuildContext context) => new Loading(),
        '/sign_up': (BuildContext context) => new Register(),
        '/sign_in': (BuildContext context) => new SignIn(),
        '/home_page': (BuildContext context) => new HomePage()
      },
      // home: new MyHomePage(),
      // home: new Start(),
      home: new SignIn(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Stack(
                children: <Widget>[
                  Container(
                    // padding: EdgeInsets.fromLTRB(left, top, right, bottom),
                    padding: EdgeInsets.fromLTRB(15.0, 50.0, 0.0, 0.0),
                    child: Text(
                      'Frutas y Verduras',
                      style: TextStyle(
                          fontSize: 45.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'SourceSansPro'),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(15.0, 100.0, 0.0, 0.0),
                    child: Text(
                      'El',
                      style: TextStyle(
                          fontSize: 50.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'SourceSansPro'),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(15.0, 150.0, 0.0, 0.0),
                    child: Text(
                      'Frutal',
                      style: TextStyle(
                          fontSize: 50.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'SourceSansPro'),
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
              child: Column(
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                        labelText: 'Correo',
                        labelStyle: TextStyle(
                            fontFamily: 'SourceSansPro',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green))),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextField(
                    decoration: InputDecoration(
                        labelText: "Contraseña",
                        labelStyle: TextStyle(
                            fontFamily: 'SourceSansPro',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green))),
                    obscureText: true,
                  ),
                  SizedBox(height: 5.0),
                  Container(
                    alignment: Alignment(1.0, 0.0),
                    padding: EdgeInsets.only(top: 15.0, left: 20.0),
                    child: InkWell(
                      child: Text(
                        'Olvido Contraseña',
                        style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'SourceSansPro',
                            fontStyle: FontStyle.italic,
                            decoration: TextDecoration.underline),
                      ),
                    ),
                  ),
                  SizedBox(height: 40.0),
                  Container(
                    height: 40.0,
                    child: Material(
                      borderRadius: BorderRadius.circular(20.0),
                      shadowColor: Colors.greenAccent,
                      color: Colors.green,
                      elevation: 7.0,
                      child: GestureDetector(
                        onTap: () {},
                        child: Center(
                          child: Text(
                            'Iniciar Sesión',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'SourceSansPro'),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Container(
                    height: 40.0,
                    color: Colors.transparent,
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.black,
                              style: BorderStyle.solid,
                              width: 1.0),
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Center(
                            // child: ImageIcon(AssetImage('')),
                          ),
                          SizedBox(width: 10.0),
                          Center(
                            child: Text(
                              'Inicio Sesión con Facebook',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'SourceSansPro'),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Container(
                    height: 40.0,
                    color: Colors.transparent,
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.black,
                              style: BorderStyle.solid,
                              width: 1.0),
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Center(
                              // child: ImageIcon(),
                              ),
                          SizedBox(width: 10.0),
                          Center(
                            child: Text(
                              'Inicio Sesión con Google',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'SourceSansPro'),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Container(
                    height: 40.0,
                    color: Colors.transparent,
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.black,
                              style: BorderStyle.solid,
                              width: 1.0),
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Center(
                              // child: ImageIcon(),
                              ),
                          SizedBox(width: 10.0),
                          Center(
                            child: Text(
                              'Inicio Sesión con Twitter',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'SourceSansPro'),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 15.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Nueva cuenta',
                  style: TextStyle(fontFamily: 'SourceSansPro'),
                ),
                SizedBox(width: 5.0),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed('routeName');
                  },
                  child: Text(
                    'Registrarte',
                    style: TextStyle(
                      color: Colors.green,
                      fontFamily: 'SourceSansPro',
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline
                    ),
                  ),
                )
              ],
            )
          ],
        ));
  }
}
