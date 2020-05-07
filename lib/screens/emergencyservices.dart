import 'package:flutter/material.dart';

class EmergencyServicesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body:Container( 
          padding:EdgeInsets.all(20.0), 
         child: Column( 
           children: <Widget>[  
             SizedBox (  
            height: 10.0
            ),
             Card( 
               elevation: 1.0, 
               child: Column( 
                 children: <Widget>[ 
                   Text("Paramedics",style:TextStyle(fontSize:18.0,color: Colors.red)), 
                   Text("998"), 
                    Container( 
                      width: double.infinity,
                      margin: EdgeInsets.only(top: 20.0),
                      child: FlatButton( 
                        color: Colors.blueAccent,
                        textColor: Colors.white,
                        onPressed: (){},
                        child: Text('Call') 
                      ), 
                        
                    ),
                 ],
               ),
             )

           ],
         ),
       ) 
    );
  }
}