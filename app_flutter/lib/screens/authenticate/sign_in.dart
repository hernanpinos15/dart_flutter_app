import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:app_flutter/shared/loading.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';
  String _error = '';
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    // return new Scaffold(
    return loading ? Loading() : Scaffold(
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
                child: Form(
                  key: formKey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: 'Correo',
                            labelStyle: TextStyle(
                                fontFamily: 'SourceSansPro',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.green))),
                        validator: (val) => !EmailValidator.validate(val, true)
                            ? 'Correo incorrecto.'
                            : null,
                        onSaved: (val) => _email = val,
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: "Contraseña",
                            labelStyle: TextStyle(
                                fontFamily: 'SourceSansPro',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.green))),
                        validator: (val) =>
                            val.length < 6 ? 'Contraseña muy corta.' : null,
                        onSaved: (val) => _password = val,
                        // onChanged: (val) {
                        //   setState(() => _password = val);
                        // },
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
                            onTap: () {
                              if (formKey.currentState.validate()) {
                                setState(() {
                                  _error = 'Todo Posi';
                                  loading = true;
                                  Navigator.of(context).pushNamed('/loading');
                                   
                                });
                              }else{
                                setState(() {
                                  _error = 'Error';
                                  loading = false;
                                });
                              }
                            },
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
                      SizedBox(height: 5.0),
                      Container(
                        child: Text(
                          _error,
                          style: TextStyle(color: Colors.red, fontSize: 14.0),
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
                )),
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
                    Navigator.of(context).pushNamed('/sign_up');
                  },
                  child: Text(
                    'Registrarte',
                    style: TextStyle(
                        color: Colors.green,
                        fontFamily: 'SourceSansPro',
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline),
                  ),
                )
              ],
            )
          ],
        ));
  }
}
