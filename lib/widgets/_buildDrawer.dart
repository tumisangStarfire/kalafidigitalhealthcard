import 'package:flutter/material.dart';
import 'package:kalafidigitalhealthcard/routers/routerconstants.dart';


class BuildDrawer extends StatefulWidget {
     BuildDrawer({Key key}) : super(key:key);
  @override
  _BuildDrawerState createState() => _BuildDrawerState();
  }
  
  class _BuildDrawerState extends State<BuildDrawer>{
  @override
  Widget build(BuildContext context) {

    return _buildDrawer(context);
  }
}
Drawer _buildDrawer(BuildContext context) {
    return Drawer( 
      child:ListView(  
        padding: EdgeInsets.zero,
        children: <Widget>[ 
          DrawerHeader( 
            child: Text("John Doe",style:TextStyle(color:Colors.white)),  
            decoration: BoxDecoration( color: Colors.blueAccent),
          ),
          ListTile(  
           leading: Icon(Icons.account_circle), 
           title: Text("profile"),
          onTap: (){ 
              Navigator.pushNamed(context, UserProfileRoute);
          },
         ),  
         ListTile(  
           leading: Icon(Icons.backup),
           title: Text("my medical files"),
          onTap: (){},
         ),  
          ListTile(  
           leading: Icon(Icons.local_pharmacy),
           title: Text("hospital center near me"),
          onTap: (){ 
            Navigator.pushNamed(context, FindHealthCenterRoute);
          },
         ),  
          ListTile(  
           leading: Icon(Icons.local_hospital),
           title: Text("emergency services"),
          onTap: (){},
         ),  
         ListTile(  
           leading: Icon(Icons.child_care),
           title: Text("child care"), 
           enabled: false,
          onTap: (){},
         ), 
          ListTile(  
           leading:Icon(Icons.card_giftcard),
           title: Text("offers & gifts"),
          onTap: (){},
         ), 
         ListTile(  
           leading: Icon(Icons.settings),
           title: Text("settings"),
          onTap: (){},
         ), 
         ListTile(  
           leading: Icon(Icons.star),
           title: Text("rate us"),
          onTap: (){},
         )
        ], 
      )
    );
  }
