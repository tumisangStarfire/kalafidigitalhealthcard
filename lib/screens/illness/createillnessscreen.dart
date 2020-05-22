import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:kalafidigitalhealthcard/controllers/healthfacilitycontroller.dart';
import 'package:kalafidigitalhealthcard/controllers/userillnesscontroller.dart';
import 'package:kalafidigitalhealthcard/models/healthfacility.dart';
import 'package:kalafidigitalhealthcard/models/illness.dart';
import 'package:kalafidigitalhealthcard/models/userillness.dart';
import 'package:kalafidigitalhealthcard/services/api_service.dart';
import 'package:kalafidigitalhealthcard/widgets/app_card.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';
import 'package:intl/intl.dart';

class CreateIllnessScreen extends StatefulWidget  {
  @override
 _CreateIllnessScreenState createState() => new _CreateIllnessScreenState();

}

class _CreateIllnessScreenState extends State<CreateIllnessScreen> {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
   final format = DateFormat("yyyy-MM-dd");
   // List data = List();
    UserIllness userIllness;
    ApiService apiService;
    HealthFacilityController _healthFacility;
    UserIllnessController _illnessList;

     List<HealthFacility> healthFacilitydata = [];
     List<Illness> illnessData = [];

@override
void initState() {
    // TODO: implement initState
  apiService = new ApiService();
  //_healthFacility= new HealthFacilityController();
  ///get Illness to drop down




  /**get health facilities to drop down */

     apiService.getHealthFacilityData().then((value) => {
       healthFacilitydata = value.toList()
    }).catchError((error)=>{
         print(error.toString())
      });

    apiService.getIllnessData().then((value) => {
      illnessData = value
  }).catchError((error)=>{
      print(error.toString())
  });
 // print(illnessData);
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
       appBar: AppBar(
        title: Text("Add Illness record"),
      ),
      body:Container(
        //padding:EdgeInsets.all(20.0),
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
   List<Widget>_getFormWidget() {

     List<Widget> formWidget = new List();

      List<DropdownMenuItem>illnessTemp =[];
      illnessTemp.add(DropdownMenuItem(child:Text('malaria'),value:'head  injury'));
      illnessTemp.add(DropdownMenuItem(child:Text('TB'),value:'broken  arm'));

      var selectedIlness = '  ';

       List<DropdownMenuItem>hospitalTemp =[];
      hospitalTemp.add(DropdownMenuItem(child:Text('Marina'),value:'Marina'));
      hospitalTemp.add(DropdownMenuItem(child:Text('Gaborone Private Hospital'),value:'Gaborone Private Hospital'));
      var selected = '  ';

    var _datePickerWidget = new Container(
       child : Padding(
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
            ),
            ),
            onShowPicker: (context, currentValue) {
              return showDatePicker(
                  context: context,
                  firstDate: DateTime(1900),
                  initialDate: currentValue ?? DateTime.now(),
                  lastDate: DateTime(2100));
            },
            autovalidate:false,
            validator: (date) => date == null ? 'Enter date of diagnosis' : null,
            onSaved: (value) {
            setState(() {
              userIllness.setDateOfDiagnosis = value;
            });
          },
        ),
       )
    );

    var _bloodPressureWidget = new Container(
        child: Padding(
          padding: EdgeInsets.only(top: 10.0,bottom: 10.0),
          child:  TextFormField(
              decoration: InputDecoration(
                labelText:"Enter recorded BP",
                  prefixIcon: Icon(Icons.timelapse,color:Colors.blueGrey),
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
          ),
        )
    );

    var _temperatureWidget=new Container(
        child: Padding(
           padding: EdgeInsets.only(top: 10.0,bottom: 10.0),
            child:TextFormField(
              decoration: InputDecoration(
                labelText:"Enter Temperature",
                prefixIcon: Icon(Icons.timelapse,color:Colors.blueGrey),
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
                      return 'temperature value is required';
                  }

                },
                onSaved: (value) {
                  setState(() {
                     userIllness.setTemperture = double.tryParse(value);

                  });

                },
            ),
          ),
        );

    var _pulseRateWidget=new Container(
          child: Padding(
            padding: EdgeInsets.only(top: 10.0,bottom: 10.0),
            child: TextFormField(
              decoration: InputDecoration(
                labelText:"Enter Pulse Rate",
                prefixIcon: Icon(Icons.timelapse,color:Colors.blueGrey),
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
              onSaved: (value) {
                setState(() {
                  userIllness.setPulseRate = int.tryParse(value);
                });
              },
            )
          )
       );

    var _illnesssWidget= new Container(
          child: Padding(
            padding: EdgeInsets.only(top: 10.0,bottom: 10.0),
            child: new SearchableDropdown.single(
                items: illnessData.map((val) {
                return new DropdownMenuItem<String>(
                       child: Text(val.name ?? "empty"), value: val.name ?? "empty");

            }).toList(),
                value:selectedIlness ,
                hint: "Select llness",
                searchHint: "type/name",
                onChanged: (value) {
                  setState(() {
                      value;
                  });
                userIllness.setTypeofIllness= value;
              },
              isExpanded: true,
            )
          )
       );

    var _healthFacilityWidget= new Container(
       child : Padding(

        padding: EdgeInsets.only(top: 10.0,bottom: 10.0),
         child: SearchableDropdown.single(
            items: healthFacilitydata.map((val) {
                return new DropdownMenuItem<String>(
                       child: Text(val.name), value: val.name);

            }).toList()
            ,
            value:selected,
            hint: "Hospital/Clinic Name",
            searchHint: "type/name",
            onChanged: (value) {
              setState(() {
                value;
              });
              userIllness.healthFacility.name =value;
          },
          isExpanded: true,
         )
       )
    );

      var _doctorsNotesWidget= new Container(
          child: Padding(
            padding: EdgeInsets.only(top: 10.0,bottom: 10.0),
            child:TextFormField(
              maxLines: 8,
              decoration: InputDecoration.collapsed(hintText:"Doctors Notes"),
              onSaved: (value) {
                setState(() {
                  userIllness.setDoctorsNotes = value;
                });
              },
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
   // formWidget.add(_illnesssWidget);
    formWidget.add(_bloodPressureWidget);
    formWidget.add(_temperatureWidget);
    formWidget.add(_pulseRateWidget);
    formWidget.add(_doctorsNotesWidget);
    formWidget.add(_submitButton);
     return formWidget;
   }

}