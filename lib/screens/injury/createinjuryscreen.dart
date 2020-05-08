import 'package:flutter/material.dart'; 
import 'package:searchable_dropdown/searchable_dropdown.dart';
import 'package:kalafidigitalhealthcard/models/userinjury.dart'; 
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart'; 
import 'package:intl/intl.dart';


class CreateInjuryScreen extends StatefulWidget  {
  @override
 _CreateInjuryScreenState createState() => new _CreateInjuryScreenState();

} 

class _CreateInjuryScreenState extends State<CreateInjuryScreen> { 
   final _formKey = GlobalKey<FormState>(); 
    UserInjury userInjury; 
    DateTime selectedDate = DateTime.now(); 
    final format = DateFormat("yyyy-MM-dd");
    
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: AppBar( 
        title: Text("Add Injury record"),
      ),
      body:Container(   
         padding:EdgeInsets.all(20.0),
        child:Form(  
          key: _formKey,
                child: ListView(
                  children: _getFormWidget()
                )
           
        )
     )
    ); 

  }  
  //list of widgets to be added to the form
   List<Widget> _getFormWidget() { 
     List<Widget> formWidget = new List();  
      List<DropdownMenuItem>injuriesTemp =[];  
      injuriesTemp.add(DropdownMenuItem(child:Text('head injury'),value:'head  injury')); 
      injuriesTemp.add(DropdownMenuItem(child:Text('broken arm'),value:'broken arm'));
      //List<DropdownMenuItem>medicationsTemp=[{'name':'panado'},{'name':'paracetamol'},{'name':'anti-inflamatory'}]; 
      var selectedItems=[];
     var _bloodPressureWidget = new TextFormField( 
        decoration: InputDecoration(labelText:"Enter BP"), 
         validator: (value){ 
            if(value.trim().isEmpty){ 
                return 'blood pressure during incident  is required';
            } 
            if(value.length > 3){ 
                return 'blood pressure cannot be greater than 3 characters';
            }
         }, 
         onSaved: (value) {
            setState(() {
              userInjury.setBloodPressure = int.tryParse(value) ;
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
             userInjury.setTemperture = double.tryParse(value);
          });
        },
      );      

       var _pulseRateWidget=new TextFormField( 
        decoration: InputDecoration(labelText:"Enter Pulse Rate"), 
        onSaved: (value) {
          setState(() {
             userInjury.setPulseRate = int.tryParse(value);
          });
        },
       ); 

       var _vitalsRecordedOnWidget=new TextFormField( 
        decoration: InputDecoration(labelText:"Vitals Recorded  on"), 
        onSaved: (value) {
          setState(() {
             userInjury.setRecordedOn = int.tryParse(value) as DateTime;
          });
        },
       );

      var _injuriesWidget= new SearchableDropdown.single( 
          items: injuriesTemp,  
          value:null ,
          hint: "Select Injury",
          searchHint: "type/name", 
          onChanged: (value) {
          setState(() {
            userInjury.setUserId  = value;
          });
        },
        isExpanded: true,
      );     
     
       var _datePickerWidget = DateTimeField(
          format: format, 
           decoration: InputDecoration( 
           labelText: 'Date of Diagnosis'
          ),
          onShowPicker: (context, currentValue) {
            return showDatePicker(
                context: context,
                firstDate: DateTime(1900),
                initialDate: currentValue ?? DateTime.now(),
                lastDate: DateTime(2100));
          },      
          validator: (value){  
             if(value.toString() == null){ 
                    return 'Date of Injury is required';
                } 

          },
          onSaved: (value) {
          setState(() {
             userInjury.setDateofInjury = value;
          });
        },
       );                 
      /* var _medicationsWidget= new SearchableDropdown.multiple( 
          items: medicationsTemp,  
          selectedItems: selectedItems,
          hint: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text("Select any"),
          ),
          searchHint: "Select any",
          onChanged: (value) {
          setState(() {
            userInjury.addPillPrescription(value);
          });
        }, 
        closeButton: (selectedItems) {
          return 
            (selectedItems.isNotEmpty  ? "Save ${selectedItems.length == 1 ? '"' + medicationsTemp[selectedItems.first].value.toString() + '"' : '(' + selectedItems.length.toString() + ')'}"
              : "Save without selection");
        },
        isExpanded: true,
      );      

     var _healthFacilityWidget= new SearchableDropdown.single( 
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
      
    formWidget.add(_bloodPressureWidget); 
    formWidget.add(_temperatureWidget); 
    formWidget.add(_pulseRateWidget);   
    formWidget.add(_datePickerWidget);
    
    formWidget.add(_injuriesWidget);  
   formWidget.add(_submitButton); 
   // formWidget.add(_medicationsWidget); 
    // formWidget.add(_healthFacilityWidget); 
    return formWidget;
   }
}