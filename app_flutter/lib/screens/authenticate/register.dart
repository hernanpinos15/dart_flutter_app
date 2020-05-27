import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:app_flutter/shared/loading.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:app_flutter/services/user_management.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';
  String _error = '';
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    // return new Scaffold(
    return loading
        ? Loading()
        : Scaffold(
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
                    padding:
                        EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
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
                                    borderSide:
                                        BorderSide(color: Colors.green))),
                            validator: (val) =>
                                !EmailValidator.validate(val, true)
                                    ? 'Correo incorrecto.'
                                    : null,
                            // onSaved: (val) => _email = val,
                            onChanged: (val) {
                              setState(() => _email = val);
                            },
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
                                    borderSide:
                                        BorderSide(color: Colors.green))),
                            validator: (val) =>
                                val.length < 6 ? 'Contraseña muy corta.' : null,
                            // onSaved: (val) => _password = val,
                            onChanged: (val) {
                              setState(() => _password = val);
                            },
                            obscureText: true,
                          ),
                          SizedBox(height: 12.0),
                          Container(
                            child: Text(
                              _error,
                              style:
                                  TextStyle(color: Colors.red, fontSize: 14.0),
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
                                      Navigator.of(context)
                                          .pushNamed('/loading');
                                      FirebaseAuth.instance
                                          .createUserWithEmailAndPassword(
                                              email: _email,
                                              password: _password)
                                          .then((signedInUser) {
                                        UserManagement().storeNewUser(
                                            signedInUser, context);
                                      }).catchError((e) {
                                        print(e);
                                      });
                                    });
                                  } else {
                                    setState(() {
                                      _error = 'Error';
                                      loading = false;
                                    });
                                  }
                                },
                                child: Center(
                                  child: Text(
                                    'Registrarse',
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
                              child: InkWell(
                                onTap: () {
                                  Navigator.of(context).pop('/sign_in');
                                },
                                child: Center(
                                  child: Text('Volver',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Montserrat')),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
              ],
            ));
  }
}
