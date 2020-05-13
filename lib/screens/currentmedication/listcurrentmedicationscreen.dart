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
          child : ListView(
            children: <Widget>[

                //tag : '_medicationdetails', //change to currentMedication.name
                  Card(
                   child : Column(
                     children: <Widget>[
                       Padding(
                        padding: const EdgeInsets.all (10.0),
                        child:  ListTile(
                          title: Text("High Blood Pressure Medication"),
                          subtitle :Text("Prescribed on : 2020-April-01"),
                         // trailing: Icon(Icons.more_vert),
                          onTap: (){

                          },

                        ),
                      ),
                      Padding(
                         padding: const EdgeInsets.all (10.0),
                         child: ExpansionTile(
                          title: Text("Received from : A Pharmacy "),
                          children: <Widget>[
                            ListTile(
                              title: Text("2-3 Time (s) a day"),
                              isThreeLine: true,
                              subtitle: Text("Expires on : 2021-April-12"),
                              //subtitle: ()

                            ),
                            ButtonBar(
                              children :<Widget>[
                                FlatButton(
                                child: Icon(Icons.share),
                                  onPressed: () { /* ... */ },
                                ),
                                FlatButton(
                                child: Icon(Icons.delete),
                                  onPressed: () { /* ... */ },
                                ),
                              ]
                            )

                          ],
                        ),
                      )
                     ],
                   )
                ),


            ],
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

class MedicationDetails extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        child:Hero(
          tag: '_medicationdetails',
          child: Padding(
            padding: EdgeInsets.all(5.0),
          ),
        )
      ),
    );
  }

}