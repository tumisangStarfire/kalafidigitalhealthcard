

import 'package:flutter/material.dart';
import 'package:kalafidigitalhealthcard/models/currentmedication.dart';
import 'package:kalafidigitalhealthcard/widgets/app_card.dart';

class CreateCurrentMedicationScreen extends StatefulWidget {
  @override
  _CreateCurrentMedicationScreenState createState() => _CreateCurrentMedicationScreenState();
}

class _CreateCurrentMedicationScreenState extends State<CreateCurrentMedicationScreen> {
    final _formKey = GlobalKey<FormState>();
    CurrentMedication currentMedication;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Pill Prescription"),
      ),
        body: Container(
           //padding:EdgeInsets.all(20.0),
           decoration:BoxDecoration(color: Colors.blueGrey),
          child:Padding(
            padding: EdgeInsets.only(top: 10.0),
            child:ListView(
               children:<Widget>[
                 AppCard(
                  child:Form(
                    key: _formKey,
                      child: ListView(
                        shrinkWrap:true,
                        children : _getFormWidget(),
                      )
                  )
                )
               ]
            )
          )
        ),
    );
  }
  //list of widgets to be added to the form
   List<Widget> _getFormWidget() {

     List<Widget> formWidget = new List();
       var _pillName=new Container(
         child : Padding(
           padding: EdgeInsets.only(top: 10.0,bottom: 10.0),
           child: TextFormField(
            decoration: InputDecoration(
              labelText:"Pill Name",
              prefixIcon: Icon(Icons.timelapse,color:Colors.blueGrey),
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
              validator: (value){
                  if(value.trim().isEmpty){
                      return 'Pill name is required';
                  }

              },
              onSaved: (value) {
                setState(() {
                  currentMedication.setPillName = value;
                });
              },
          ),
         ),
       );

       var _dailyDosage=new Container(
         child : Padding(
           padding: EdgeInsets.only(top: 10.0,bottom: 10.0),
           child: TextFormField(
            decoration: InputDecoration(
              labelText:"Daily Intake",
              prefixIcon: Icon(Icons.timelapse,color:Colors.blueGrey),
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
            validator: (value){
                if(value.trim().isEmpty){
                    return 'enter the prescribed daily intake e.g2  ';
                }

            },
            onSaved: (value) {
              setState(() {
                currentMedication.setDailyDosage =int.tryParse(value);
              });
            },
          ),
         )
       );

      var _pharmaceutical=new Container(
        child: Padding(
          padding: EdgeInsets.only(top: 10.0,bottom: 10.0),
          child: TextFormField(
            decoration: InputDecoration(
                  labelText:"Pharmaceutical/Clinic",
                  prefixIcon: Icon(Icons.timelapse,color:Colors.blueGrey),
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
              validator: (value){
                  if(value.trim().isEmpty){
                      return 'Pharmaceutical/Clinic name is required';
                  }

              },
              onSaved: (value) {
                setState(() {
                  currentMedication.setPharmaceutical = value;
                });
              },
          ),
        ),
      );
      var _frequency=new Container(
        child: Padding(
           padding: EdgeInsets.only(top: 10.0,bottom: 10.0),
          child : TextFormField(
          decoration: InputDecoration(
            labelText:"Difference in Hours for intake",
            prefixIcon: Icon(Icons.timelapse,color:Colors.blueGrey),
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
          validator: (value){
              if(value.trim().isEmpty){
                  return 'every 3hrs ';
              }

          },
          onSaved: (value) {
            setState(() {
              currentMedication.setFrequency = int.tryParse(value);
            });
          },
        )
        ),
      );


    var _submitButton= Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(top: 20.0),
                      child: FlatButton(
                        color: Colors.blueAccent,
                        textColor: Colors.white,
                        onPressed: (){},
                        child: Text('Save')),
                    );


       formWidget.add(_pillName);
       formWidget.add(_dailyDosage);
       formWidget.add(_pharmaceutical);
       formWidget.add(_frequency);
       formWidget.add(_submitButton);

      return formWidget;
   }
}