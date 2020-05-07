import 'package:flutter/material.dart';
import 'package:kalafidigitalhealthcard/models/currentmedicalcondition.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';

class CreateMedicalConditionScreen extends StatefulWidget {
  @override
  _CreateMedicalConditionScreenState createState() => _CreateMedicalConditionScreenState();
}

class _CreateMedicalConditionScreenState extends State<CreateMedicalConditionScreen> {

  final _formKey = GlobalKey<FormState>(); 
  CurrentMedicalCondition medicalCondition;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container( 
        padding:EdgeInsets.all(20.0), 
        decoration:BoxDecoration(color: Colors.blueGrey),
        child:Form( 
          key:_formKey,
          child: ListView(
            children:_getFormWidget(),
          ),
        ),
      )
    );
  } 

  //list of widgets to be added to the form
   List<Widget> _getFormWidget() { 
     List<Widget> formWidget = new List();   
       var _conditionNameWidget=new TextFormField( 
        decoration: InputDecoration(labelText:"Enter Medical Condition Name"), 
        validator: (value){ 
             if(value.trim().isEmpty){ 
                return 'condition name is required';
             } 
             
        }, 
        onSaved: (value) {
          setState(() {
             medicalCondition.setConditionName = value;
          }); 
        },
      ); 

     /*  var _healthFacilityWidget= new SearchableDropdown.single( 
          items: injuriesTemp,  
          value:userInjury.injurySustained ,
          hint: "Select Injury",
          searchHint: "type/name", 
          onChanged: (value) {
          setState(() {
            userInjury.healthFacility = value;
          });
        },
        isExpanded: true,
      ); */   

      var _submitButton= Container( 
                      width: double.infinity,
                      margin: EdgeInsets.only(top: 20.0),
                      child: FlatButton( 
                        color: Colors.blueAccent,
                        textColor: Colors.white,
                        onPressed: (){},
                        child: Text('Save')),
                    );

      formWidget.add(_conditionNameWidget); 
      formWidget.add(_submitButton);

    return formWidget;
   }   
}