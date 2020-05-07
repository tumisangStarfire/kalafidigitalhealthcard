

import 'package:flutter/material.dart';
import 'package:kalafidigitalhealthcard/models/currentmedication.dart';

class CraeteCurrentMedicationScreen extends StatefulWidget {
  @override
  _CraeteCurrentMedicationScreenState createState() => _CraeteCurrentMedicationScreenState();
}

class _CraeteCurrentMedicationScreenState extends State<CraeteCurrentMedicationScreen> { 
    final _formKey = GlobalKey<FormState>();  
    CurrentMedication currentMedication; 

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( 
        title: Text("Add Pill Prescription"),
      ),
        body: Container( 
           padding:EdgeInsets.all(20.0), 
        decoration:BoxDecoration(color: Colors.blueGrey),
        child:Form( 
          key:_formKey,
          child: ListView(
            children:_getFormWidget(),
          ),
        ),
        ),
    );
  } 
  //list of widgets to be added to the form
   List<Widget> _getFormWidget() { 

     List<Widget> formWidget = new List();  
       var _pillName=new TextFormField( 
        decoration: InputDecoration(labelText:"Enter Name f Pill"), 
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
      );  
       
       var _dailyDosage=new TextFormField( 
        decoration: InputDecoration( 
          labelText:"required daily intake" ),  
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
      );  
      
      var _pharmaceutical=new TextFormField( 
        decoration: InputDecoration(labelText:"Provide where you were given the medication"), 
        validator: (value){ 
             if(value.trim().isEmpty){ 
                return 'Pharmaceutical/Hspita name is required';
             } 
             
        }, 
        onSaved: (value) {
          setState(() {
             currentMedication.setPharmaceutical = value;
          });
        },
      );  
      var _frequency=new TextFormField( 
        decoration: InputDecoration(labelText:"Time difference of medication intakes  "), 
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