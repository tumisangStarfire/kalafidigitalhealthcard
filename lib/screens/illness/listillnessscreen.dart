import 'package:flutter/material.dart';
import 'package:kalafidigitalhealthcard/routers/routerconstants.dart';

class ListIllnessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Text("History of Illness"),
      ),
      body:Container(
         decoration:BoxDecoration(color: Colors.blueGrey),
        child:Padding(
          padding: EdgeInsets.only(top: 10.0),
          child: ListView (
            children: <Widget>[
              Card(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all (10.0),
                      child:ListTile(
                      //leading: Icon(Icons.account_circle),
                      title: Text("Measles"),
                      subtitle: Text("2013-Mar-04"),
                     // trailing: Icon(Icons.delete),
                      onTap: (){},
                      ),
                    ),
                    Padding(
                         padding: const EdgeInsets.all (5.0),
                        child: ExpansionTile(
                          title: Text("Diagnosis from : Marina Hospital "),
                          children: <Widget>[
                            ListTile(
                              title: Text("Vitals Taken On : 2013-March-04"),
                            ),
                            ListTile(
                              title: Text("Blood Preasure : 89"),
                            ),
                            ListTile(
                              title: Text("Temperature : 37"),
                            ),
                            ListTile(
                              title: Text("Heart Beat Per Second : 3"),
                            ),
                            Text("Doctors Notes: Patient came complaining of migraine and headache pains. Is un-able to sleep nor swallow."),
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
                        )
                      )
                  ],
                )
              )
            ],
          ) ,
        )
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
            Navigator.popAndPushNamed(context, CreateUserIllnessRoute);
        }
        ),
    );
  }
}