import 'package:flutter/material.dart';
import 'package:kalafidigitalhealthcard/models/userillness.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';

class CreateIllnessScreen extends StatefulWidget  {
  @override
 _CreateIllnessScreenState createState() => new _CreateIllnessScreenState();

} 

class _CreateIllnessScreenState extends State<CreateIllnessScreen> { 

  final _formKey = GlobalKey<FormState>();  

  UserIllness userIllness;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold( 
       appBar: AppBar( 
        title: Text("Add Illness record"),
      ),
      body:Container(   
        padding:EdgeInsets.all(20.0), 
        decoration:BoxDecoration(color: Colors.blueGrey),
        child: Form( 
                key:_formKey, 
                child: ListView(
                  children:_getFormWidget(),
                )
             ),
            
        
      )
    );
  }

  //list of widgets to be added to the form
   List<Widget>_getFormWidget() { 
     List<Widget> formWidget = new List();    

      List<DropdownMenuItem>injuriesTemp =[];  
      injuriesTemp.add(DropdownMenuItem(child:Text('malaria'),value:'head  injury')); 
      injuriesTemp.add(DropdownMenuItem(child:Text('TB'),value:'broken  arm')); 

    var _dateOfDiagnosisWidget=new TextFormField( 
        decoration: InputDecoration(labelText:"Date of Diagnosis"), 
        onSaved: (value) {
          setState(() {
             userIllness.setDateOfDiagnosis = int.tryParse(value) as DateTime;
          });
        },
       );

    var _bloodPressureWidget = new TextFormField( 
        decoration: InputDecoration(labelText:"Enter BP"), 
         validator: (value){ 
            if(value.trim().isEmpty){ 
                return 'blood pressure is required';
            } 
            if(value.length > 3){ 
                return 'blood pressure value cannot be greater than 3 characters';
            }

         }, 
         onSaved: (value) {
            setState(() {
              userIllness.setBloodPressure = int.tryParse(value) ;
             });
        },
     );   

      var _temperatureWidget=new TextFormField( 
        decoration: InputDecoration(labelText:"Enter Temperature"), 
        validator: (value){ 
             if(value.trim().isEmpty){ 
                return 'temperature value is required';
             } 
             if(value.length > 4){ 
               return 'temperature cannot be greater than  characters';
             }
        }, 
        onSaved: (value) {
          setState(() {
             userIllness.setTemperture = double.tryParse(value);
          });
        },
      );  

       var _pulseRateWidget=new TextFormField( 
        decoration: InputDecoration(labelText:"Enter Pulse Rate"), 
        onSaved: (value) {
          setState(() {
             userIllness.setPulseRate = int.tryParse(value);
          });
        },
       );  

       var _illnesssWidget= new SearchableDropdown.single( 
          items: injuriesTemp,  
          value:null ,
          hint: "Select Injury",
          searchHint: "type/name", 
          onChanged: (value) {
          setState(() {
            userIllness.setTypeofIllness  = value;
          });
        },
        isExpanded: true,
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
       


    formWidget.add(_dateOfDiagnosisWidget);
    formWidget.add(_bloodPressureWidget); 
    formWidget.add(_temperatureWidget);   
    formWidget.add(_pulseRateWidget);  
    formWidget.add(_illnesssWidget); 
    formWidget.add(_submitButton); 
     return formWidget;
   }

}