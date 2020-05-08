import 'package:flutter/material.dart';
import 'package:kalafidigitalhealthcard/routers/routerconstants.dart';

class ListVaccineScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Padding(
         padding: const EdgeInsets.only (top: 10.0),   
          child : 
          Card(  
                child: Padding(  
                  padding: const EdgeInsets.all (16.0), 
                  child:  ListTile( 
                    title: Text("H1 N1"), 
                    subtitle :Text("Admisteredon On:2010-April-01"), 
                    trailing: Icon(Icons.more_vert),
                    onTap: (){

                    },
                  
                  ),
                )
             )
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