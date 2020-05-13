import 'package:flutter/material.dart';
import 'package:kalafidigitalhealthcard/routers/routerconstants.dart';

class UsersMedicalFiles extends StatefulWidget {
  @override
  _UsersMedicalFilesState createState() => _UsersMedicalFilesState();
}

class _UsersMedicalFilesState extends State<UsersMedicalFiles> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Medical Files"),),
       body: Container(
          decoration:BoxDecoration(color: Colors.blueGrey),
          child: Padding(
           padding: const EdgeInsets.only (top: 10.0),
           child: ListView(
              children: <Widget>[
                Card(

                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                        ListTile(

                        title: Text('X-Ray'),
                        subtitle: Text('20 December 2012'),
                        trailing: Icon(Icons.more_vert),
                        onTap: (){

                        },
                      ),
                      ButtonBar(
                        children :<Widget>[
                          FlatButton(
                          child: Icon(Icons.share),
                            onPressed: () { /* ... */ },
                          ),
                          FlatButton(
                          child: Icon(Icons.file_download),
                            onPressed: () { /* ... */ },
                          ),
                        ]
                      )
                    ],

                  ),
                )
              ],
            ),
          ),
       ),
        floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
            Navigator.popAndPushNamed(context, CreateMedicalFilesRoute);
        }
      ),
    );
  }
}