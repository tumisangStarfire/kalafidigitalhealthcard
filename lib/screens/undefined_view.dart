import 'package:flutter/material.dart';

class UndefinedView extends StatelessWidget { 

 
   const UndefinedView({Key key}) : super(key :key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('route unknown'),
        ),
    );
  }
}