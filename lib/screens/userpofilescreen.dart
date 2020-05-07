import 'package:flutter/material.dart';
import 'package:kalafidigitalhealthcard/routers/routerconstants.dart';
import 'package:kalafidigitalhealthcard/widgets/_buildDrawer.dart';

class UserProfileScreen extends StatelessWidget { 
    GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(  
       key: _scaffoldKey,
      appBar: _buildAppBar(),
      body:Container(  
         decoration:BoxDecoration(color: Colors.blueGrey),
        child: ListView(
        children:<Widget>[
          SizedBox (  
            height: 32.0
          ), 
          _buildUpperSection(), 
          Padding( 
            padding:EdgeInsets.only(left:32.0), 
            child:Container(  
              height:6.0 ,
              decoration:BoxDecoration(
                gradient :LinearGradient( 
                  begin:Alignment.topLeft, 
                  end:Alignment.bottomRight, 
                  colors: [Colors.greenAccent,Colors.blueAccent]
                )
              )

            )
          ),   
          SizedBox(height: 16.0),
          _buildUserDetails(),  
          SizedBox (  
            height: 4.0
          ),
          _buildProfileMenu(context)
        ]
      ),
     ), 
      drawer: BuildDrawer(),

    );
  }

  Column _buildProfileMenu(context) {
    return Column( 
          children: <Widget>[  
            Card(  
              elevation:1.0 ,  
                child: Column( 
                  children: <Widget>[ 
                     ListTile(
                      leading: Icon(Icons.mood_bad),
                      title: Text('Medical Conditions'),
                       onTap: () {
                         Navigator.pushNamed(context, MedicalConditionsRoute);
                      },  
                    ),  
                  
                  ],
              ),
            ), 
            Card( 
              child: Column( 
                children: <Widget>[
                   ListTile(
                      leading: Icon(Icons.star),
                      title: Text('Current Medication'),
                      
                    ), 
                    
                ],
              ),
            ),
            Card( 
                child: Column(
                  children: <Widget>[ 
                     ListTile(
                      leading: Icon(Icons.nature),
                      title: Text('Allergies'),
                    ), 
                   
                  ],
                ),
            ), 
             Card( 
                child: Column(
                  children: <Widget>[ 
                     ListTile(
                      leading: Icon(Icons.bug_report),
                      title: Text('History of Illnesses'), 
                       onTap: () {
                        Navigator.pushNamed(context, ListUserIllnessRoute);
                      }, 
                    ), 
                   
                  ], 
                  
                ), 
               
            ), 
             Card( 
                child: Column(
                  children: <Widget>[ 
                     ListTile(
                      leading: Icon(Icons.flag),
                      title: Text('History of Injuries'), 
                       onTap: () {
                        Navigator.pushNamed(context, ListUserInjuriesRoute);
                      },
                    ), 
                   
                  ],
                ),
            ), 
             Card( 
                child: Column(
                  children: <Widget>[ 
                     ListTile(
                      leading: Icon(Icons.album),
                      title: Text('Vaccines'),
                    ), 
                   
                  ],
                ),
            )
          ],
        );
  }

  Padding _buildUserDetails() {
    return Padding( 
          padding: const EdgeInsets.only(left: 32.0, right: 48.0),
          child: Row( 
             mainAxisAlignment: MainAxisAlignment.spaceBetween , 
            children: <Widget>[  
              Column( 
                children: <Widget>[
                  Text("167cm",style: TextStyle(fontSize:24.0),) ,
                  Text("Height",style: TextStyle(color:Colors.white),)
                ],
              ), 
              Column( 
                children: <Widget>[
                  Text("70 kg",style: TextStyle(fontSize:24.0),) ,
                  Text("Weight",style: TextStyle(color:Colors.white),)
                ],
              ), 
               
              Column( 
                children: <Widget>[
                  Text("132",style: TextStyle(fontSize:24.0),) ,
                  Text("BMI",style: TextStyle(color:Colors.white),)
                ],
              ),
              Column( 
                children: <Widget>[
                  Text("36",style: TextStyle(fontSize:24.0),) ,
                  Text("Waist Size",style: TextStyle(color:Colors.white),)
                ],
              )
            ],
          ), 
        );
  }

  Padding _buildUpperSection() {
    return Padding( 
          
          padding:EdgeInsets.all(32.0),
          child:Container(  
             
            child:Column( 
           
              children: <Widget>[  
                
                Row( 
                  mainAxisAlignment: MainAxisAlignment.spaceBetween , 
                  children: <Widget>[],
                ),  
                SizedBox(height:8.0),
                CircleAvatar(
                  backgroundImage: NetworkImage("https://static1.squarespace.com/static/55f45174e4b0fb5d95b07f39/t/5aec4511aa4a991e53e6c044/1525433627644/Alexandra+Agoston+archives.jpg?format=1000w"),

                ),  
                SizedBox(height:16.0),
                Text("John Doe",style: TextStyle(fontSize:24.0,color:Colors.white),
                ),  
                SizedBox(height:4.0),
                Text("Blood Type AB",style: TextStyle(fontSize:11.0,color: Colors.red),
                ),

              ],
          ), 
          ),
        );
  } 
   AppBar _buildAppBar() {
    return AppBar(
      leading:IconButton(icon: Icon(Icons.menu),onPressed:(){
        _scaffoldKey.currentState.openDrawer();
      } ), 
      title: Text("Health Data"),  
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