import 'package:flutter/material.dart';
import 'package:kalafidigitalhealthcard/routers/routerconstants.dart';
import 'package:kalafidigitalhealthcard/widgets/_buildDrawer.dart';

class DashBoardScreen extends StatelessWidget { 

  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(  
      key: _scaffoldKey,
      appBar: _buildAppBar(), 
      body: Center( 
       

      ), 
      drawer: BuildDrawer(), 
     );
  }
  AppBar _buildAppBar() {
    return AppBar(
      leading:IconButton(icon: Icon(Icons.menu),onPressed:(){
        _scaffoldKey.currentState.openDrawer();
      } ), 
      title: Text("Health Dashboard"),  
      elevation: 0,
      actions: <Widget>[
        Icon(Icons.notifications),
        Container(
          width:50,
          alignment: Alignment.center, 
           
          child: Stack( 
            
            children:<Widget>[ 
              Container(  
                width: 35, 
                height:35,  
                decoration: BoxDecoration( 
                  shape:BoxShape.circle, 
                  color:Colors.grey, 
                  image:DecorationImage( 
                    fit:  BoxFit.cover, 
                     
                    image: NetworkImage("https://static1.squarespace.com/static/55f45174e4b0fb5d95b07f39/t/5aec4511aa4a991e53e6c044/1525433627644/Alexandra+Agoston+archives.jpg?format=1000w"),

                  )
                ),
               ) , 
              Positioned(
                bottom:0, 
                right:2,
                child: Container(
                  width:10, 
                  height:10, 
                  decoration:BoxDecoration(
                    shape:BoxShape.circle, 
                    color:Color(0xff00ff1d)
                  )
                )
              ), 
              
            ]
          ),
        ),  
        SizedBox(width:10),
      ],
    );
  }
}