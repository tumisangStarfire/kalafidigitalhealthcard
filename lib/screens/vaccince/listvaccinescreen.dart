import 'package:flutter/material.dart';
import 'package:kalafidigitalhealthcard/routers/routerconstants.dart';

class ListVaccineScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
         title: Text("Vaccines Taken"),
        ),
      body:Container(
        decoration:BoxDecoration(color: Colors.blueGrey),
        child: Padding(
          padding: const EdgeInsets.only (top: 10.0),
          child :ListView(
            children: <Widget>[
              Card(
                child:Column(
                  children: <Widget>[
                     Padding(
                      padding: const EdgeInsets.all (16.0),
                      child:  ListTile(
                        title: Text("SARS Vaccine"),
                        isThreeLine: true,
                        subtitle :Text("Admistered On : 2010-April-01"),
                       // subtitle :Text('Administered A'),
                        trailing: Icon(Icons.delete),
                        onTap: (){

                        },

                      ),
                    ),
                  ],
                )
              ),
            ],
          ),
        ),
      ),
       floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: (){
                Navigator.pushNamed(context, CreateUserVaccineRoute);
            }
          ),
    );
  }
}