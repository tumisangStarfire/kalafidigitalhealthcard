import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget { 
  CustomAppBar({Key key,this.title}) :super(key:key);
  final String title; 

  @override
  Widget build(BuildContext context) { 

    return Scaffold(
       appBar: AppBar(
          title: Text(this.title), 
          backgroundColor: Colors.green,
        ),
    );
  }
}