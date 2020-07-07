import 'package:flutter/material.dart';
import 'package:kalafidigitalhealthcard/routers/routerconstants.dart';
import 'package:kalafidigitalhealthcard/controllers/currentmedicationcontroller.dart';
import 'package:kalafidigitalhealthcard/models/currentmedication.dart';

class ListCurrentMedicationScreen extends StatefulWidget {
  @override
  _ListCurrentMedicationScreenState createState() => _ListCurrentMedicationScreenState();
}

class _ListCurrentMedicationScreenState extends State<ListCurrentMedicationScreen> {

  final String userId="5e44126d243f4f795e8ef25b";
  final CurrentMedicationController _currentMedicationController= CurrentMedicationController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Current Medication"),
      ),
       body:Container(
        decoration:BoxDecoration(color: Colors.blueGrey),
        child: Padding(
         padding: const EdgeInsets.all (5.0),
         child: Column(
           children: <Widget>[
              FutureBuilder(
                  future: _currentMedicationController.getUserCurrentMedications(userId),
                  builder:  (BuildContext context, AsyncSnapshot<List<CurrentMedication>> snapshot) {
                    // print(snapshot.data);
                      if (snapshot.hasError) print(snapshot.error);
                      if (snapshot.hasData) {
                          List<CurrentMedication> _medicationData = snapshot.data;
                          print(_medicationData);
                          return Expanded(child: _medicationsData(_medicationData));
                      }else{
                      return Center(child: CircularProgressIndicator());
                    }
                  }
                ),
           ],
         ),
        )
      ),
       floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: (){
                Navigator.pushNamed(context, CreateCurrentMedicationRoute);
            }
          ),

    );
  }

  ListView _medicationsData(data) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: data.length,
      itemBuilder: (context, index) {
        return Card(
          child: _cardData(data[index].pillName,data[index].datePrescribed,data[index].dailyDosage,data[index].pharmaceutical,data[index].frequency)
        );
      }
    );
  }
  Column _cardData(String pillName,DateTime datePrescribed,int dailyDosage,String pharmaceuticalName,int frequency){
    return Column(
      children: <Widget>[
          Padding(
            padding: const EdgeInsets.all (10.0),
              child:  ListTile(
                title: Text(pillName),
                subtitle :Text("Received On :" + datePrescribed.toString()),
                onTap: (){
                },
              ),
            ),
            Padding(
          padding: const EdgeInsets.all (10.0),
          child: ExpansionTile(
            title: Text("Recieved from At : " + pharmaceuticalName),
            subtitle :Text("Taken " + dailyDosage.toString() +" (s) a day, every " + frequency.toString() + " hour(s)"),
            children: <Widget>[
                ButtonBar(
                  children :<Widget>[
                    FlatButton(
                      child: Icon(Icons.share),
                        onPressed: () { /* ... */ },
                    ),
                    FlatButton(
                      child: Icon(Icons.delete),
                      onPressed: () { /* ... */
                          //deleteFunction(_storageId)
                       },
                    ),
                  ]
                )

              ],
          ),
        )

      ],
    );
  }

}

