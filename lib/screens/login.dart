import 'package:flutter/material.dart';
import 'package:kalafidigitalhealthcard/widgets/app_card.dart';

class LoginScreen extends StatelessWidget { 
  const LoginScreen({Key key}) : super(key :key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column( 
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AppCard(
                child: Text( 'test',style: TextStyle(fontSize :32.0),textAlign: TextAlign.center,),
             
            ),
            AppCard(
              child: Container( 
                child: Column(
                  children : <Widget>[
                    TextFormField( 
                      decoration: InputDecoration(labelText:"Cellphone")
                    ),
                     TextFormField( 
                      decoration: InputDecoration(labelText:"Password")
                    ),
                    Container( 
                      width: double.infinity,
                      margin: EdgeInsets.only(top: 20.0),
                      child: FlatButton( 
                        color: Colors.blueAccent,
                        textColor: Colors.white,
                        onPressed: (){},
                        child: Text('Login')),
                    ),
                    Container( 
                      alignment: Alignment.centerLeft,
                      child: FlatButton(onPressed: null, child: Text('forgot password?')),
                    )
                  ]
                ),

              )
            ), 
            Row( 
              //mainAxisAligment: MainAxisAlignment.center, 
              children: <Widget>[
                Text("Don't have an account?"),
                FlatButton(onPressed: null, child: Text('Sign up'))
              ],
            )
          ]
        ),
      )
    );
  }
}