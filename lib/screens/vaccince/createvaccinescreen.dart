import 'package:flutter/material.dart';
import 'package:kalafidigitalhealthcard/models/uservaccine.dart';
import 'package:kalafidigitalhealthcard/widgets/app_card.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';

class CreateVaccineScreen extends StatefulWidget {
  @override
  _CreateVaccineScreenState createState() => _CreateVaccineScreenState();
}

class _CreateVaccineScreenState extends State<CreateVaccineScreen> {
  final _formKey = GlobalKey<FormState>();
  UserVaccine _userVaccine;
  final format = DateFormat("yyyy-MM-dd");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Injury Sustained"),
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

   List<Widget> _getFormWidget() {
     List<Widget> formWidget = new List();
      DateTime selectedDate = DateTime.now();
      List<DropdownMenuItem>vaccinesTemp =[];
      vaccinesTemp.add(DropdownMenuItem(child:Text('H1 N1 Sars'),value:'head  injury'));
      var selectedVaccine ='';

      List<DropdownMenuItem>hospitalTemp =[];
      hospitalTemp.add(DropdownMenuItem(child:Text('Marina'),value:'Marina'));
      hospitalTemp.add(DropdownMenuItem(child:Text('Gaborone Private Hospital'),value:'Gaborone Private Hospital'));
      var selected = '';

      var _vaccinesWidget= new Container(
        child : Padding(
           padding: EdgeInsets.only(top: 10.0,bottom: 10.0),
          child: new SearchableDropdown.single(
              items: vaccinesTemp,
              value:selectedVaccine,
              hint: "Select Vaccine",
              searchHint: "type/name",
              onChanged: (value) {
              setState(() {
                _userVaccine.vaccineType  = value;
              });
            },
            isExpanded: true,
          )
        )
      );
     var _datePickerWidget =new Container(
      child : Padding(
        padding: EdgeInsets.only(top: 10.0,bottom: 10.0),
        child:  DateTimeField(
          format: format,
           decoration: InputDecoration(
           labelText: 'Date of Injury',
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
             _userVaccine.dateAdministered = value;
          });
        },
       )
      ),
    );
    var _healthFacilityWidget= new Container(
          child : Padding(
            padding: EdgeInsets.only(top: 10.0,bottom: 10.0),
            child: SearchableDropdown.single(
                items: hospitalTemp,
                value:selected,
                hint: "Hospital/Clinic Name",
                searchHint: "type/name",
                onChanged: (value) {
                setState(() {
                  _userVaccine.healthfacility.name = value;
                });
              },
              isExpanded: true,
            )
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
       formWidget.add(_datePickerWidget);
       formWidget.add(_healthFacilityWidget);
       formWidget.add(_vaccinesWidget);
       formWidget.add(_submitButton);
     return formWidget;
   }
}