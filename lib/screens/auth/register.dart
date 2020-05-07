import 'package:flutter/material.dart';
import 'package:kalafidigitalhealthcard/widgets/app_card.dart';

class RegisterScreen extends StatelessWidget { 

   const RegisterScreen({Key key}) : super(key :key);
  @override
  Widget build(BuildContext context) { 
    
    return Scaffold ( 
      body :Container( 
         decoration:BoxDecoration(color: Colors.blueGrey),
         child: Column( 
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[  
            AppCard(
              child: Container( 
                child: Column(
                  children : <Widget>[ 
                     TextFormField( 
                      decoration: InputDecoration(labelText:"First Name")
                    ),
                     TextFormField( 
                      decoration: InputDecoration(labelText:"Last Name")
                    ),
                    TextFormField( 
                      decoration: InputDecoration( 
                        labelText:"Cellphone", 
                         prefixIcon: Icon(Icons.phone) 
                        ), 
                      keyboardType: TextInputType.number,
                    ),
                    Container( 
                      width: double.infinity,
                      margin: EdgeInsets.only(top: 20.0),
                      child: FlatButton( 
                        color: Colors.blueAccent,
                        textColor: Colors.white,
                        onPressed: (){},
                        child: Text('Register')),
                    ),
  
                  ]
                ),

              )
            ),
          ],
         ),
      ),
    );
  }
}