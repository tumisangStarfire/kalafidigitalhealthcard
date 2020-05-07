import 'package:flutter/material.dart';

class CreateVaccineScreen extends StatefulWidget {
  @override
  _CreateVaccineScreenState createState() => _CreateVaccineScreenState();
}

class _CreateVaccineScreenState extends State<CreateVaccineScreen> { 
  final _formKey = GlobalKey<FormState>(); 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body:Container( 
        padding:EdgeInsets.all(20.0), 
        decoration:BoxDecoration(color: Colors.blueGrey),
        child:Form( 
          key:_formKey,
          child: ListView(
            children:_getFormWidget(),
          ),
        ),
      )
    );
  } 

   List<Widget> _getFormWidget() { 
     List<Widget> formWidget = new List();   
     return formWidget;
   }
}