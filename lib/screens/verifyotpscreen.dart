import 'package:flutter/material.dart';
import 'package:kalafidigitalhealthcard/widgets/app_card.dart';

class VerifyOTPScreen extends StatelessWidget { 

  const  VerifyOTPScreen({Key key}) : super(key :key); 

  @override
  Widget build(BuildContext context) {
    return Scaffold ( 
      body: SingleChildScrollView(
        child: Column(
           mainAxisAlignment: MainAxisAlignment.center, 
           children: <Widget>[ 
              AppCard(
                child: Container( 
                  child: Column(
                    children : <Widget>[
                      TextFormField( 
                        decoration: InputDecoration(labelText:"Otp Code"), 
                        validator: (otpcode){ 
                          if(otpcode.trim().isEmpty){ 
                            return 'otp code is required';
                          } 
                          if(otpcode.length > 6){ 
                            return 'OTP cannot be greater than 6 characters';
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
                        child: Text('Submit')),
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