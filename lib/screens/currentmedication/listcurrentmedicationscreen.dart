import 'package:flutter/material.dart';
import 'package:kalafidigitalhealthcard/routers/routerconstants.dart';

class ListCurrentMedicationScreen extends StatefulWidget {
  @override
  _ListCurrentMedicationScreenState createState() => _ListCurrentMedicationScreenState();
}

class _ListCurrentMedicationScreenState extends State<ListCurrentMedicationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Current Medication"),
      ),
       body:Container(
        decoration:BoxDecoration(color: Colors.blueGrey),
        child: Padding(
         padding: const EdgeInsets.only (top: 10.0),
          child :
          Card(
                child: Padding(
                  padding: const EdgeInsets.all (16.0),
                  child:  ListTile(
                    title: Text("High Blood Pressure Medication"),
                    subtitle :Text("Prescribed on:2020-April-01"),
                    trailing: Icon(Icons.more_vert),
                    onTap: (){

                    },

                  ),
                )
             )
        )
      ),
       floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: (){
                Navigator.pushNamed(context, CreateCurrentMedicationRoute);
            }
          ),

    );
  }
}