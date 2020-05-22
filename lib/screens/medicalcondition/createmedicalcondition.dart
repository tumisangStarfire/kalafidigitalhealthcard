import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:kalafidigitalhealthcard/controllers/healthfacilitycontroller.dart';
import 'package:kalafidigitalhealthcard/controllers/medicalconditioncontroller.dart';
import 'package:kalafidigitalhealthcard/models/currentmedicalcondition.dart';
import 'package:kalafidigitalhealthcard/routers/routerconstants.dart';
import 'package:kalafidigitalhealthcard/services/api_service.dart';
import 'package:kalafidigitalhealthcard/widgets/app_card.dart';
import 'package:kalafidigitalhealthcard/models/healthfacility.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';
import 'package:intl/intl.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CreateMedicalConditionScreen extends StatefulWidget {
  @override
  _CreateMedicalConditionScreenState createState() => _CreateMedicalConditionScreenState();
}

class _CreateMedicalConditionScreenState extends State<CreateMedicalConditionScreen> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final format = DateFormat("yyyy-MM-dd");
  final _formKey = GlobalKey<FormState>();

  String selectedHealthFacility = ' ';
  DateTime _dateOfDiagnosis;
  String _conditionName;
  HealthFacility _healthFacility;

  final HealthFacilityController _healthFcilityController = HealthFacilityController();
  final MedicationConditionController _medicalConditionController = MedicationConditionController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
       key:_scaffoldKey,
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
            onShowPicker: (context, currentValue)  {
            return showDatePicker(
                  context: context,
                  firstDate: DateTime(1900),
                  initialDate: currentValue ?? DateTime.now(),
                  lastDate: DateTime(2100));
            },
            autovalidate:false,
            validator: (date) => date == null ? 'Enter date of diagnosis' : null,
            onSaved: (date) {
              setState(() {
               date;


              });
                this._dateOfDiagnosis=date;

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
               value;

              });
              this._conditionName = value;

            },
          )
         )
       );

     var _healthFacilityWidget= new Container(
       child : Padding(
          padding: EdgeInsets.only(top: 10.0,bottom: 10.0),
         child: FutureBuilder<List<HealthFacility>>(
          future: _healthFcilityController.listHealthFacilities(),
          builder: (BuildContext context, AsyncSnapshot<List<HealthFacility>> snapshot){
            if (!snapshot.hasData) return SizedBox(width: 30, height: 5.0, child: LinearProgressIndicator());
              return Container(
                    width: 50,
                    child: SearchableDropdown.single(
                    items: snapshot.data.map((val) => DropdownMenuItem<HealthFacility>(
                                      child: Text(val.name),
                                      value: val,
                                    ))
                                .toList(),
                      value:selectedHealthFacility,
                      hint: "Hospital/Clinic Name",
                      searchHint: "type/name",
                       validator: (value) => value == null ? 'Select where you were diagnosed' : null,
                      onChanged: (value) {
                        setState(() {
                            value;
                        });
                        this._healthFacility = value;

                      },
                      isExpanded: false,
                    )
              );
          }),
       ),
    );


      var _submitButton= Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(top: 20.0),
                      child: FlatButton(
                        color: Colors.blueAccent,
                        textColor: Colors.white,
                        onPressed: ()  {
                          _formKey.currentState.save();
                           var valid = _formKey.currentState.validate();
                           if(valid == true){
                             print(_conditionName);

                               CurrentMedicalCondition usermedicalCondition = CurrentMedicalCondition(
                                 userId: "5e44126d243f4f795e8ef25b",
                                 conditionName: _conditionName,
                                 dateOfDiagnosis: _dateOfDiagnosis,
                                 healthFacility: _healthFacility,
                                );

                             _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text("Sending data")));
                                _medicalConditionController.store(usermedicalCondition)
                               .then((value) => {
                                  Fluttertoast.showToast(
                                    msg: value.toString(),
                                    toastLength: Toast.LENGTH_LONG,
                                    gravity: ToastGravity.CENTER,
                                    backgroundColor: Colors.green,
                                    textColor: Colors.white,
                                    fontSize: 16.0
                                ),
                                 Navigator.popAndPushNamed(context, MedicalConditionsRoute)
                               })
                               .catchError((error)=>{
                                 Fluttertoast.showToast(
                                    msg: "Something went wrong try again later",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 16.0
                                ),
                                print(error.toString())
                              });


                           }else{
                              _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text("please enter required details")));
                           }
                        },
                        child: Text('Save')),
                    );

       formWidget.add(_datePickerWidget);
       formWidget.add(_healthFacilityWidget);
       formWidget.add(_conditionNameWidget);
       formWidget.add(_submitButton);

    return formWidget;
   }

}