
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:kalafidigitalhealthcard/models/userprofile.dart';
import 'package:kalafidigitalhealthcard/widgets/_buildDrawer.dart';
import 'package:kalafidigitalhealthcard/widgets/app_card.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {


  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key:_scaffoldKey,
      appBar: _buildAppBar(),
      body: Container(
        decoration: BoxDecoration(color: Colors.blueGrey),
         child: ListView(
           children: <Widget>[
              SizedBox(height:18.0),
                 Column(
                   children: <Widget>[

                   Container(
                      child: Padding(
                        padding: EdgeInsets.only(top : 10.0, bottom : 10.0),
                        child: Card(
                          elevation:1.0 ,
                          shape : RoundedRectangleBorder(  borderRadius: BorderRadius.circular(12.0)),
                          //onPressed: null,
                          child: Column(
                            children: <Widget>[
                               ListTile(

                                title: Text('Personal Information'),
                                onTap: () {
                                  // Navigator.pushNamed(context, MedicalConditionsRoute);
                                },
                                 trailing: Icon(Icons.arrow_forward)
                              ),
                            ],
                          )
                          ),
                      )
                    ),

                    Container(
                      child: Padding(
                        padding: EdgeInsets.only(top : 10.0, bottom : 10.0),
                        child: Card(
                          elevation:1.0 ,
                          shape : RoundedRectangleBorder(  borderRadius: BorderRadius.circular(12.0)),
                          //onPressed: null,
                          child: Column(
                            children: <Widget>[
                               ListTile(

                                title: Text('Address Information'),
                                onTap: () {
                                  // Navigator.pushNamed(context, MedicalConditionsRoute);
                                },
                                 trailing: Icon(Icons.arrow_forward)
                              ),
                            ],
                          )
                          ),
                      )
                    ),

                     Container(
                      child: Padding(
                        padding: EdgeInsets.only(top : 10.0, bottom : 10.0),
                        child: Card(
                          elevation:1.0 ,
                          shape : RoundedRectangleBorder(  borderRadius: BorderRadius.circular(12.0)),
                          //onPressed: null,
                          child: Column(
                            children: <Widget>[
                               ListTile(

                                title: Text('Health Data'),
                                onTap: () {
                                  // Navigator.pushNamed(context, MedicalConditionsRoute);
                                },
                                 trailing: Icon(Icons.arrow_forward)
                              ),
                            ],
                          )
                          ),
                      )
                    ),

                     Container(
                      child: Padding(
                        padding: EdgeInsets.only(top : 10.0, bottom : 10.0),
                        child: Card(
                          elevation:1.0 ,
                          shape : RoundedRectangleBorder(  borderRadius: BorderRadius.circular(12.0)),
                          //onPressed: null,
                          child: Column(
                            children: <Widget>[
                               ListTile(

                                title: Text('Health Goals'),
                                onTap: () {
                                  // Navigator.pushNamed(context, MedicalConditionsRoute);
                                },
                                 trailing: Icon(Icons.arrow_forward)
                              ),
                            ],
                          )
                          ),
                      )
                    ),

                   Container(
                      child: Padding(
                        padding: EdgeInsets.only(top : 10.0, bottom : 10.0),
                        child: Card(
                          elevation:1.0 ,
                          shape : RoundedRectangleBorder(  borderRadius: BorderRadius.circular(12.0)),
                          //onPressed: null,
                          child: Column(
                            children: <Widget>[
                               ListTile(

                                title: Text('Change Password'),
                                onTap: () {
                                  // Navigator.pushNamed(context, MedicalConditionsRoute);
                                },
                                 trailing: Icon(Icons.arrow_forward)
                              ),
                            ],
                          )
                          ),
                      )
                    ),

                     Container(
                      child: Padding(
                        padding: EdgeInsets.only(top : 10.0, bottom : 10.0),
                        child: Card(
                          elevation:1.0 ,
                          shape : RoundedRectangleBorder(  borderRadius: BorderRadius.circular(12.0)),
                          //onPressed: null,
                          child: Column(
                            children: <Widget>[
                               ListTile(

                                title: Text('Prefferences'),
                                onTap: () {
                                  // Navigator.pushNamed(context, MedicalConditionsRoute);
                                },
                                 trailing: Icon(Icons.arrow_forward)
                              ),
                            ],
                          )
                          ),
                      )
                    ),



                   ],
                 ),
           ],
         ),
      ),
      drawer: BuildDrawer(),
    );
  }



  AppBar _buildAppBar() {
    return AppBar(
      leading: Builder(
        builder:  (context) => IconButton(
          icon: Icon(Icons.menu),
          onPressed:(){
            Scaffold.of(context).openDrawer();
            //_scaffoldKey.currentState.openDrawer();

        }),
      ),
      title: Text("Settings"),
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