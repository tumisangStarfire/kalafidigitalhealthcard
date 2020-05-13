import 'package:flutter/material.dart';
import 'package:kalafidigitalhealthcard/controllers/healthfacilitycontroller.dart';
import 'package:kalafidigitalhealthcard/models/healthfacility.dart';
import 'package:kalafidigitalhealthcard/widgets/_buildDrawer.dart';

class FindHealthCenterScreen extends StatefulWidget {
  @override
  _FindHealthCenterScreenState createState() => _FindHealthCenterScreenState();
}

class _FindHealthCenterScreenState extends State<FindHealthCenterScreen> {
 /// final _scaffoldKey = GlobalKey<>();
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  HealthFacilityController _healthFacility =  new HealthFacilityController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key:_scaffoldKey,
       appBar: _buildAppBar(),
      body: Container(
         padding:EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[

            Container(
              child: Padding(
                padding: EdgeInsets.only(top:5.0, bottom:5.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    labelText:"Search",
                    hintText:"enter optician/clinic name/hospital ",
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
                    )
                  ),

                )
              ),
            ),
            FutureBuilder(
               future:  _healthFacility.listHealthFacilities(),
               builder:  (BuildContext context, AsyncSnapshot<List<HealthFacility>> snapshot) {
                 if (snapshot.hasError) print(snapshot.error);
                 if (snapshot.hasData) {
                   print(snapshot.data);
                    var healthFacilitiesData = snapshot.data;
                     return Padding(
                       padding: EdgeInsets.all(1.0),
                       child:  Container(
                          child: _healthFacilities(healthFacilitiesData),

                        ),
                     );

                 }else{
                   return Center(child: CircularProgressIndicator());
                 }

               }
            ),

          ],
        ),
      ),
      drawer: BuildDrawer(),
    );
  }

  ListView _healthFacilities( data) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        return Card(
          child: _cardData(data[index].name, data[index].region)
        );
      }
    );
  }

  Column _cardData(String title, String region,){
    return Column(
      children: <Widget>[
        Text(title,style: TextStyle(fontSize:26.0)),
        Text(region,style: TextStyle(fontSize:16.0)),
        Text("3908168",style: TextStyle(fontSize:11.0,color:Colors.grey)),
         Row(                     // mainAxisAlignment: MainAxisAlignment,
           children: <Widget>[
            Icon(Icons.location_on,color: Colors.green,),
            Text("Gaborone",style: TextStyle(fontSize:18.0)),
           ],
         ),
        SizedBox (
          height: 6.0
        ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Icon(Icons.access_time,color: Colors.grey,),
              Text("Opens at: 00:00",style: TextStyle(fontSize:11.0)),
              Icon(Icons.access_time,color: Colors.grey,),
              Text("Closes at: 00:00",style: TextStyle(fontSize:11.0)),
            ],
          )
      ],

    );

  }

   AppBar _buildAppBar() {
    return AppBar(
      leading: Builder(
        builder:  (context) => IconButton(
          icon: Icon(Icons.menu),
          onPressed:(){
            Scaffold.of(context).openDrawer();
           //// _scaffoldKey.currentState.openDrawer();

        }),
      ),
      title: Text("Health Services"),
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