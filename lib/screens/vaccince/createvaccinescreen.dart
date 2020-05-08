import 'package:flutter/material.dart';
import 'package:kalafidigitalhealthcard/models/uservaccine.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';

class CreateVaccineScreen extends StatefulWidget {
  @override
  _CreateVaccineScreenState createState() => _CreateVaccineScreenState();
}

class _CreateVaccineScreenState extends State<CreateVaccineScreen> { 
  final _formKey = GlobalKey<FormState>();  
  UserVaccine _userVaccine; 
  
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

   List<Widget> _getFormWidget() { 
     List<Widget> formWidget = new List();   
      DateTime selectedDate = DateTime.now();    
      List<DropdownMenuItem>vaccinesTemp =[];  
      vaccinesTemp.add(DropdownMenuItem(child:Text('H1 N1 Sars'),value:'head  injury')); 
     
      var _vaccinesWidget= new SearchableDropdown.single( 
          items: vaccinesTemp,  
          value:null ,
          hint: "Select Injury",
          searchHint: "type/name", 
          onChanged: (value) {
          setState(() {
            _userVaccine.vaccineType  = value;
          });
        },
        isExpanded: true,
      );       
      TextEditingController dateCtl = TextEditingController();
       var _datePickerWidget=new TextFormField(  
          controller: dateCtl,
          decoration: InputDecoration(  
            labelText:"Select date" 
            ),  
            onTap: () async{
                DateTime date = DateTime(1900);
                FocusScope.of(context).requestFocus(new FocusNode());

                date = await showDatePicker(
                              context: context, 
                              initialDate:DateTime.now(),
                              firstDate:DateTime(1900),
                              lastDate: DateTime(2100));

                dateCtl.text = date.toIso8601String();},
            validator: (value){ 
                if(value.trim().isEmpty){ 
                    return 'condition name is required';
                } 
                
            }, 
            onSaved: (value) {
              setState(() {
                _userVaccine.dateAdministered = value as DateTime;
              }); 
            },
      );    

      


      /* var _healthFacilityWidget= new SearchableDropdown.single( 
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
       formWidget.add(_vaccinesWidget);  
       formWidget.add(_datePickerWidget); 
       formWidget.add(_submitButton); 
     return formWidget;
   }
}