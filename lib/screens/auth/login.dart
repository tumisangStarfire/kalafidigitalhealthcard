import 'package:flutter/material.dart';
import 'package:kalafidigitalhealthcard/routers/routerconstants.dart';
import 'package:kalafidigitalhealthcard/widgets/app_card.dart';

class LoginScreen extends StatelessWidget {  
   final _formKey = new GlobalKey<FormState>();  
  //const LoginScreen({Key key}) : super(key :key); 
  
 
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
       
      body: Container( 
           decoration:BoxDecoration(color: Colors.blueGrey),
        child: Column(  
          
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[  
            AppCard( 
              child:Form( 
                key: _formKey,
                child: Container( 
                  child: Column(
                    children : <Widget>[
                      TextFormField( 
                        decoration: InputDecoration( 
                          labelText:"Cellphone", 
                          prefixIcon: Icon(Icons.phone,color:Colors.blueGrey),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.blueAccent,
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.red,
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          
                          ), 
                        keyboardType: TextInputType.number,
                        validator: (cellphone){ 
                          if(cellphone.trim().isEmpty){ 
                            return 'Cellphone is required';
                          } 
                          if(cellphone.length > 8){ 
                            return 'Cellphone cannot be greater than 8 characters';
                          }
                        },
                      ),
                      TextFormField( 
                        decoration: InputDecoration( 
                          labelText:"Password",
                           prefixIcon: Icon(Icons.lock,color:Colors.blueGrey), 
                           enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.blueAccent,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.red,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          ),
                        obscureText: true, 
                        validator: (password){ 
                          if(password.trim().isEmpty){ 
                            return 'Password is required';
                          }
                        },
                      ),
                      Container( 
                        width: double.infinity,
                        margin: EdgeInsets.only(top: 20.0),
                        child: FlatButton( 
                          color: Colors.blueAccent,
                          textColor: Colors.white,
                          onPressed: (){
                              Navigator.pushNamed(context, UserProfileRoute);
                          },
                          child: Text('Login')),
                      ),
                      Container( 
                        alignment: Alignment.centerLeft,
                        child: FlatButton(onPressed: null, child: Text('forgot password?')),
                      )
                    ]
                  ),

                ), 
              ),  
            ),  
            Padding( 
              padding: const EdgeInsets.all(10.0),
              child:Row(  
                
                mainAxisAlignment: MainAxisAlignment.center,  
                //margin:EdgeInsets.all(10.0),
                children: <Widget>[
                  Text("Don't have an account?"),
                  FlatButton(
                    onPressed: (){
                      Navigator.pushNamed(context, RegisterScreenRoute);
                    }, 
                    color: Colors.blueAccent, 
                    textColor: Colors.white,
                    child: Text('Sign up'))
                ],
              ), 
            )
          ]
        ),
      )
    );
  }
}