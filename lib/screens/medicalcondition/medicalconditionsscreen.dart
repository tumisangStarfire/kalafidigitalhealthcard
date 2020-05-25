import 'package:flutter/material.dart';
import 'package:kalafidigitalhealthcard/controllers/medicalconditioncontroller.dart';
import 'package:kalafidigitalhealthcard/models/currentmedicalcondition.dart';
import 'package:kalafidigitalhealthcard/routers/routerconstants.dart';
import 'package:kalafidigitalhealthcard/widgets/app_card.dart';

class MedicalConditionsScreen extends StatefulWidget {
  @override
  _MedicalConditionsState createState() => _MedicalConditionsState();
}

class _MedicalConditionsState extends State<MedicalConditionsScreen> {
  final String userId="5e44126d243f4f795e8ef25b";
  final MedicationConditionController _medicationConditionController = MedicationConditionController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Existing Medical Conditions"),
        ),
        body:Container(
            decoration:BoxDecoration(color: Colors.blueGrey),
          child:Column(
            children: <Widget>[

                FutureBuilder(
                  future: _medicationConditionController.getUserMedicalConditions(userId),
                  builder:  (BuildContext context, AsyncSnapshot<List<CurrentMedicalCondition>> snapshot) {
                    // print(snapshot.data);
                      if (snapshot.hasError) print(snapshot.error);
                      if (snapshot.hasData) {
                          List<CurrentMedicalCondition> _currentMedicalConditionData = snapshot.data;
                          print(_currentMedicalConditionData);
                          return Expanded(child: _medicalConditionsData(_currentMedicalConditionData));
                      }else{
                      return Center(child: CircularProgressIndicator());
                    }
                  }
                ),


            ],
          )
        ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: (){
                Navigator.pushNamed(context, CreateMedicalConditionRoute);
            }
          ),
    );
  }
   ListView _medicalConditionsData(data  ) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: data.length,
      itemBuilder: (context, index) {
        return Card(
          child: _cardData(data[index].conditionName,data[index].dateOfDiagnosis,data[index].healthFacility.name,data[index].userId)
        );
      }
    );
  }
    Column _cardData(String conditionName,DateTime dateOfDiagnosis,String _healthFacilityName,String _storageId){
     return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all (10.0),
            child:  ListTile(
              title: Text(conditionName),
              subtitle :Text("Diagnosed On :" + dateOfDiagnosis.toString()),

              onTap: (){

              },
            ),
        ),
         Padding(
          padding: const EdgeInsets.all (10.0),
          child: ExpansionTile(
            title: Text("Diagnosed At :" + _healthFacilityName),
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
      ]
    );
  }
}