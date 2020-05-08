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
        appBar: AppBar(
          title: Text("Existing Medical Conditions"),
        ),  
        body:Container(  
            decoration:BoxDecoration(color: Colors.blueGrey), 
          child: Padding ( 
            padding: const EdgeInsets.only (top: 10.0),  
             child :ListView( 
                children: <Widget>[ 
                  Card(  
                  child: Padding(  
                    padding: const EdgeInsets.all (16.0), 
                    child:  ListTile( 
                      title: Text("Diabetes"), 
                      subtitle :Text("Diagnosed On:2010-April-01"), 
                      trailing: Icon(Icons.more_vert),
                      onTap: (){

                      },
                    
                    ),
                  )
             ),
                ],
             ),
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