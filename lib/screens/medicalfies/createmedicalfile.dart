import 'package:flutter/material.dart'; 
import 'package:searchable_dropdown/searchable_dropdown.dart'; 
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart'; 
import 'package:intl/intl.dart';


class CreateMedicalFileScreen extends StatefulWidget  {
  @override
 _CreateMedicalFileScreenState createState() => new _CreateMedicalFileScreenState();

} 

class _CreateMedicalFileScreenState extends State<CreateMedicalFileScreen> { 
   final _formKey = GlobalKey<FormState>(); 
   
    DateTime selectedDate = DateTime.now(); 
    final format = DateFormat("yyyy-MM-dd");
    
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: AppBar( 
        title: Text("Medical file"),
      ),
      body:Container(   
         padding:EdgeInsets.all(10.0),
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
      List<DropdownMenuItem>medicalFileTemp =[];  
      medicalFileTemp.add(DropdownMenuItem(child:Text('X-Ray'),value:'X-Ray')); 
      medicalFileTemp.add(DropdownMenuItem(child:Text('Lab Result'),value:'Lab result'));
      //List<DropdownMenuItem>medicationsTemp=[{'name':'panado'},{'name':'paracetamol'},{'name':'anti-inflamatory'}]; 
  

      var _medicalFileTypesWidget= new SearchableDropdown.single( 
          items: medicalFileTemp,  
          value:null ,
          hint: "Select medical file tpe",
          searchHint: "type/name", 
          onChanged: (value) {
          setState(() {
              value;
          });
        },
        isExpanded: true,
      );      
       var _fileNameWidget = new TextFormField( 
        decoration: InputDecoration(labelText:"File Name"), 
         validator: (value){ 
            if(value.trim().isEmpty){ 
                return 'File Name is required';
            } 
            if(value.length > 3){ 
                return 'File name should be larger than 4 characters';
            }
         }, 
         onSaved: (value) {
            setState(() {
             /// userInjury.setBloodPressure = int.tryParse(value) ;
             });
        },
     );  
     
       var _datePickerWidget = DateTimeField(
          format: format, 
           decoration: InputDecoration( 
           labelText: 'Date obtained'
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
                    return 'Date of obtained is required';
                } 

          },
          onSaved: (value) {
          setState(() {
             //userInjury.setDateofInjury = value;
          });
        },
       );                 
     

     /*var _healthFacilityWidget= new SearchableDropdown.single( 
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
      
    formWidget.add(_medicalFileTypesWidget); 
    formWidget.add(_fileNameWidget); 
    formWidget.add(_datePickerWidget);
    formWidget.add(_submitButton); 
   // formWidget.add(_medicationsWidget); 
    // formWidget.add(_healthFacilityWidget); 
    return formWidget;
   }
}