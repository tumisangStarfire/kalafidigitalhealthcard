import 'package:flutter/material.dart';
import 'package:kalafidigitalhealthcard/routers/routerconstants.dart';
import 'package:kalafidigitalhealthcard/widgets/app_card.dart';

class MedicalConditionsScreen extends StatefulWidget {
  @override
  _MedicalConditionsState createState() => _MedicalConditionsState();
}

class _MedicalConditionsState extends State<MedicalConditionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:Container(  
           decoration:BoxDecoration(color: Colors.blueGrey),
          child:ListView( 
            children: <Widget>[ 
              Card( 
                child: Column( 
                  children: <Widget>[
                    Text("Patient currently suffers from  acute dyfeciency  syndrome"), 
                    Text("Diagnosed On:2010-April-01"), 
                    Text("Private Hospital"), 
                    Icon(Icons.more_vert),
                ],
                ) 
              )
            ],
          ), 
          
        ), 
        floatingActionButton: FloatingActionButton( 
          child: Icon(Icons.add),
          onPressed: (){ 
              Navigator.pushNamed(context, CreateMedicalConditionRoute);
          } 
        ),
    );
  }
}