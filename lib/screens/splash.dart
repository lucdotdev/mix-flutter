import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mix/screens/redirector.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  void gotoNextScreen() async{
  await  Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => new RedirectorScreen()));
   }
   @override
  void initState() {
   
    super.initState();

    new Timer(Duration(milliseconds: 2000),
     gotoNextScreen
    );
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
      color: Colors.white,
      child: Center(
        child: Image.asset('assets/splash1.jpg'),
      ),
      ));
  }
}