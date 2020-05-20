import 'package:flutter/material.dart';
import 'dart:async';

import 'UI/login/loginpage.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: SplashScreen(),
        routes: <String, WidgetBuilder>{
          '/HomeScreen': (BuildContext context) => Loginpage()
        },
        debugShowCheckedModeBanner: false
    );
  }
}



class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTime() async {
    var _duration = new Duration(seconds:0);
    return new Timer(_duration, navigationPage);
  }
  void navigationPage() {
    Navigator.of(context).pushReplacementNamed('/HomeScreen');
  }
  @override
  void initState() {
    super.initState();
    startTime();
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
        Container(
          decoration: BoxDecoration(
         color: Colors.grey,
           border: new Border.all(color: Colors.transparent),
            image: DecorationImage(
              image: new AssetImage("assets/images/build.png"),fit: BoxFit.fitWidth,alignment: Alignment.bottomCenter, // <-- BACKGROUND IMAGE
                                      ),
          ),
        ),
        Scaffold(
           backgroundColor: Colors.transparent,
            
        ),
      ],

    );
  }
}
