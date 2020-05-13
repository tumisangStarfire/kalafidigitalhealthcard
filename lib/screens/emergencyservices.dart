import 'package:flutter/material.dart';

class EmergencyServicesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Get quick help"),
      ),
       body:Container(
         // padding:EdgeInsets.all(20.0),
          decoration:BoxDecoration(color: Colors.blueGrey),
         child: Padding(
             padding: const EdgeInsets.only (top: 10.0),
           child: ListView(
             children: <Widget>[
               Card(
                 child: Column(
                    children: <Widget>[
                      Padding(
                          padding: const EdgeInsets.all (2.0),
                          child:  ListTile(

                            title: Text("Health Services"),
                            subtitle: Text("998"),
                           trailing: Icon(Icons.call),
                            onTap: (){

                            },
                          ),
                        ),

                    ],
                 ),
               ),
               Card(
                 child: Column(
                    children: <Widget>[
                      Padding(
                          padding: const EdgeInsets.all (2.0),
                          child:  ListTile(

                            title: Text("Police"),
                            subtitle: Text("999"),
                           trailing: Icon(Icons.call),
                            onTap: (){

                            },
                          ),
                        ),

                    ],
                 ),
               ),
               Card(
                 child: Column(
                    children: <Widget>[
                      Padding(
                          padding: const EdgeInsets.all (2.0),
                          child:  ListTile(

                            title: Text("Fire Department"),
                            subtitle: Text("998"),
                           trailing: Icon(Icons.call),
                            onTap: (){

                            },
                          ),
                        ),

                    ],
                 ),
               ),
               Card(
                 child: Column(
                    children: <Widget>[
                      Padding(
                          padding: const EdgeInsets.all (2.0),
                          child:  ListTile(

                            title: Text("Health Services"),
                            subtitle: Text("998"),
                           trailing: Icon(Icons.call),
                            onTap: (){

                            },
                          ),
                        ),

                    ],
                 ),
               )
             ],
           )

         )
       )
    );
  }
}