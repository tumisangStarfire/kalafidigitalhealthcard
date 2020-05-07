import 'package:flutter/material.dart';
import 'package:kalafidigitalhealthcard/routers/router.dart' as router;
import 'package:kalafidigitalhealthcard/routers/routerconstants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{ 
  const MyApp({Key key}) : super(key : key);

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.black),
       //home: LoginScreen());
       onGenerateRoute: router.generateRoute,
       initialRoute: LoginScreenRoute, 
    );
  } 
  
}