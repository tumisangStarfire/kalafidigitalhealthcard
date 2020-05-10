import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:kalafidigitalhealthcard/models/currentmedicalcondition.dart';
import 'package:kalafidigitalhealthcard/widgets/app_card.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';
import 'package:intl/intl.dart';

class CreateMedicalConditionScreen extends StatefulWidget {
  @override
  _CreateMedicalConditionScreenState createState() => _CreateMedicalConditionScreenState();
}

class _CreateMedicalConditionScreenState extends State<CreateMedicalConditionScreen> {
  final format = DateFormat("yyyy-MM-dd");
  final _formKey = GlobalKey<FormState>();
  CurrentMedicalCondition medicalCondition;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Current Medical Condition"),
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
   List<Widget> _getFormWidget() {
     List<Widget> formWidget = new List();

       List<DropdownMenuItem>hospitalTemp =[];
      hospitalTemp.add(DropdownMenuItem(child:Text('Marina'),value:'Marina'));
      hospitalTemp.add(DropdownMenuItem(child:Text('Gaborone Private Hospital'),value:'Gaborone Private Hospital'));
      var selected = '';
     var _datePickerWidget = new Container(
       child: Padding(
         padding: EdgeInsets.only(top: 10.0,bottom: 10.0),
         child: DateTimeField(
          format: format,
            decoration: InputDecoration(
            labelText: 'Date of Diagnosis',
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
            )
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
                      return 'Date of Illness is required';
                  }

            },
            onSaved: (value) {
            setState(() {
              medicalCondition.setDateOfDiagnosis = value;
            });
          },
        )
       )
     );

       var _conditionNameWidget=new Container(
         child: Padding(
           padding: EdgeInsets.only(top: 10.0,bottom: 10.0),
           child :TextFormField(
            decoration: InputDecoration(
              labelText:"Enter Medical Condition Name",
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
              )
            ),
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
          )
         )
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
              medicalCondition.healthFacility = value;
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
       formWidget.add(_conditionNameWidget);
       formWidget.add(_submitButton);

    return formWidget;
   }
}