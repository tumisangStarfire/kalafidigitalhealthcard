import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(  
        fit:StackFit.expand,
        children: <Widget>[ 
          Container( 
            decoration:BoxDecoration( 
              color: Colors.deepPurple, 
              gradient :LinearGradient(
                colors: [Colors.grey,Colors.blue ]
                )
            )
          ), 

          Column(
            mainAxisAlignment: MainAxisAlignment.center, 
            children: <Widget>[ 
              CircleAvatar(
                backgroundColor: Colors.white, 
                radius: 75.0, 
                child: Icon(Icons.local_hospital,color :Colors.lightBlue,size:50.0),
              )
            ],
          ) , 
          Padding(
            padding:EdgeInsets.only(top:10.0)
          ), 
          Text("Kalafi Digital Health Card",style: TextStyle(),)


        ], 
      ),
    );
  }
}