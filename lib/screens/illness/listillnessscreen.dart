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
        child:ListView (  
        
        children: <Widget>[  
          ListTile(  
              //leading: Icon(Icons.account_circle), 
              title: Text("Measles"),  
              subtitle: Text("2013-Mar-04"),
              trailing: Icon(Icons.more_vert),
              onTap: (){},
              ), 
        ],
      ) , 
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