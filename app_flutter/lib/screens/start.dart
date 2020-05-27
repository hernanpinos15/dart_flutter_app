import 'package:flutter/material.dart';
import 'package:app_flutter/screens/authenticate/sign_in.dart';

class Start extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final user = null;

    if(user == null){
      return SignIn(); 
    }
  }

}
