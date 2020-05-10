import 'dart:io';

import 'package:flutter/material.dart';
import 'package:kalafidigitalhealthcard/widgets/app_card.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';
import 'package:file_picker/file_picker.dart';


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
         decoration:BoxDecoration(color: Colors.blueGrey),
        child: Padding(
          padding: EdgeInsets.only(top: 10.0),
          child: ListView(
             children: <Widget>[
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
          ),
        )
     )
    );

  }
  //list of widgets to be added to the form
   List<Widget> _getFormWidget()  {
     List<Widget> formWidget = new List();
      List<DropdownMenuItem>medicalFileTemp =[];
      medicalFileTemp.add(DropdownMenuItem(child:Text('X-Ray'),value:'X-Ray'));
      medicalFileTemp.add(DropdownMenuItem(child:Text('Lab Result'),value:'Lab result'));
      var selected =' ';


      var _medicalFileTypesWidget= new Container(
        child: Padding(
          padding: null,
          child : SearchableDropdown.single(
            items: medicalFileTemp,
            value:selected ,
            hint: "Select medical file tpe",
            searchHint: "type/name",
            onChanged: (value) {
            setState(() {
                value;
            });
          },
          isExpanded: true,
         )
        ),
      );
       var _fileNameWidget = new Container(
          child : Padding(
            padding: EdgeInsets.only(top: 10.0,bottom: 10.0),
            child: TextFormField(
            decoration: InputDecoration(
              labelText:"File Name",
               prefixIcon: Icon(Icons.calendar_today,color:Colors.blueGrey),
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
           ),
          )
       );



      var _healthFacilityWidget = new Container(
          child : Padding(
            padding: EdgeInsets.only(top: 10.0,bottom: 10.0),
            child: TextFormField(
            decoration: InputDecoration(
              labelText:"Health Facility where you obtained the medical file",
               prefixIcon: Icon(Icons.calendar_today,color:Colors.blueGrey),
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
                      return 'This is required';
                  }
                  if(value.length > 3){
                      return 'name should be larger than 3 characters';
                  }
              },
              onSaved: (value) {
                  setState(() {
                  /// userInjury.setBloodPressure = int.tryParse(value) ;
                  });
              },
           ),
          )
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

    formWidget.add(_medicalFileTypesWidget);
     formWidget.add(_healthFacilityWidget);
    formWidget.add(_fileNameWidget);
    formWidget.add(_submitButton);
   // formWidget.add(_medicationsWidget);
    // formWidget.add(_healthFacilityWidget);
    return formWidget;
   }
}