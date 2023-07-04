import 'package:flutter/material.dart';
import 'package:samachar/view/home.dart';
import 'package:samachar/view/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  bool showingSplash = true;

  LoadHome(){
    Future.delayed(Duration(seconds: 3),(){
      setState(() {
        showingSplash = false;
      });
    });

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    LoadHome();
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Samachar',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: showingSplash ? SplashScreen() : HomeScreen(),
    );
  }
}

