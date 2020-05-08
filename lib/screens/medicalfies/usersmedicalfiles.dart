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
       body: Container(
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
                       child: const Text('View'),
                        onPressed: () { /* ... */ },
                      ), 
                       FlatButton(
                       child: const Text('Download'),
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
        floatingActionButton: FloatingActionButton( 
        child: Icon(Icons.add),
        onPressed: (){ 
            Navigator.popAndPushNamed(context, CreateMedicalFilesRoute);
        } 
      ),
    );
  }
}