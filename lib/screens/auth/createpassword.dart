import 'package:flutter/material.dart';
import 'package:kalafidigitalhealthcard/widgets/app_card.dart';

class CreatePasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
       body: SingleChildScrollView(
        child: Column(
           mainAxisAlignment: MainAxisAlignment.center, 
           children: <Widget>[ 
              AppCard(
                child: Container( 
                  child: Column(
                    children : <Widget>[
                      TextFormField( 
                        decoration: InputDecoration(labelText:"Password"), 
                        validator: (password){ 
                          if(password.trim().isEmpty){ 
                            return 'password is required';
                          } 
                          if(password.length < 6){ 
                            return 'password cannot be less than 6 characters';
                          }
                        }, 
                      ), 
                      TextFormField( 
                        decoration: InputDecoration(labelText:"Password"), 
                        validator: (confirmPassword){ 
                          if(confirmPassword.trim().isEmpty){ 
                            return 'confirm password is required';
                          } 
                          if(confirmPassword.length < 6){ 
                            return 'password cannot be less than 6 characters';
                          }
                        }, 
                      ), 
                       Container( 
                      width: double.infinity,
                      margin: EdgeInsets.only(top: 20.0),
                      child: FlatButton( 
                        color: Colors.blueAccent,
                        textColor: Colors.white,
                        onPressed: (){},
                        child: Text('Create Password')),
                    ),
                    ],
                  ),
                ),
              ), 
           ],
        ),
      ),
      
    );
  }
}