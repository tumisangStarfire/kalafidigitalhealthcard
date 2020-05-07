import 'package:flutter/material.dart';
import 'package:kalafidigitalhealthcard/routers/routerconstants.dart';
import 'package:kalafidigitalhealthcard/widgets/app_card.dart';

class ListlInjuryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
       appBar: AppBar(
        title: Text("History of Injuries"),
      ),   
      body:ListView ( 
        children: <Widget>[  
          ListTile(  
              //leading: Icon(Icons.account_circle), 
              title: Text("Head Injuty"),  
              subtitle: Text("2013-Mar-04"),
              trailing: Icon(Icons.more_vert),
              onTap: (){},
              ), 
        ],
      ) , 
      floatingActionButton: FloatingActionButton( 
        child: Icon(Icons.add),
        onPressed: (){ 
            Navigator.popAndPushNamed(context, CreateUserInjuryRoute);
        } 
        ),
    );
  }
}