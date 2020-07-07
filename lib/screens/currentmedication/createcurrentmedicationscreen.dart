
import 'package:intl/intl.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:kalafidigitalhealthcard/controllers/currentmedicationcontroller.dart';
import 'package:kalafidigitalhealthcard/models/currentmedication.dart';
import 'package:kalafidigitalhealthcard/routers/routerconstants.dart';
import 'package:kalafidigitalhealthcard/widgets/app_card.dart';

class CreateCurrentMedicationScreen extends StatefulWidget {
  @override
  _CreateCurrentMedicationScreenState createState() => _CreateCurrentMedicationScreenState();
}

class _CreateCurrentMedicationScreenState extends State<CreateCurrentMedicationScreen> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    final _formKey = GlobalKey<FormState>();
    final format = DateFormat("yyyy-MM-dd");
    final CurrentMedicationController _currentMedicationController= CurrentMedicationController();
    String _pillName;
    DateTime _datePrescribed;
    int _dailyDosage;
    String _pharmaceutical;
    int _frequency;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       key:_scaffoldKey,
      appBar: AppBar(
        title: Text("Add Pill Prescription"),
      ),
        body: Container(
           //padding:EdgeInsets.all(20.0),
           decoration:BoxDecoration(color: Colors.blueGrey),
          child:Padding(
            padding: EdgeInsets.only(top: 10.0),
            child:ListView(
               children:<Widget>[
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
            )
          )
        ),
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
                labelText: 'Date Prescribed',
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
                validator: (date) => date == null ? 'Enter date prescribed' : null,
                onSaved: (date) {
                  setState(() {
                  date;


                  });
                    this._datePrescribed=date;

                },
            )
          )
        );

       var _pillNameWidget=new Container(
         child : Padding(
           padding: EdgeInsets.only(top: 10.0,bottom: 10.0),
           child: TextFormField(
            decoration: InputDecoration(
              labelText:"Pill Name",
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
                      return 'Pill name is required';
                  }

              },
              onSaved: (value) {
                setState(() {
                value;
                });
                this._pillName = value;
              },
          ),
         ),
       );

       var _dailyDosageWidget=new Container(
         child : Padding(
           padding: EdgeInsets.only(top: 10.0,bottom: 10.0),
           child: TextFormField(
            decoration: InputDecoration(
              labelText:"Daily Intake",
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
              keyboardType: TextInputType.number,
            validator: (value){
                if(value.trim().isEmpty){
                    return 'enter the prescribed daily intake e.g2  ';
                }

            },
            onSaved: (value) {
              setState(() {
               value;
              });
             this._dailyDosage =int.tryParse(value);
            },
          ),
         )
       );

      var _pharmaceuticalWidget=new Container(
        child: Padding(
          padding: EdgeInsets.only(top: 10.0,bottom: 10.0),
          child: TextFormField(
            decoration: InputDecoration(
                  labelText:"Pharmaceutical/Clinic",
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
                      return 'Pharmaceutical/Clinic name is required';
                  }

              },
              onSaved: (value) {
                setState(() {
                  value;
                });
                this._pharmaceutical =value;
              },
          ),
        ),
      );
      var _frequencyWidget=new Container(
        child: Padding(
           padding: EdgeInsets.only(top: 10.0,bottom: 10.0),
          child : TextFormField(
          decoration: InputDecoration(
            labelText:"Difference in Hours for intake",
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
          keyboardType: TextInputType.number,
          validator: (value){
              if(value.trim().isEmpty){
                  return 'every 3hrs ';
              }

          },
          onSaved: (value) {
            setState(() {
             value;
            });
            this._frequency =  int.tryParse(value);
          },
        )
        ),
      );


    var _submitButton= Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(top: 20.0),
                      child: FlatButton(
                        color: Colors.blueAccent,
                        textColor: Colors.white,
                        onPressed: (){
                          _formKey.currentState.save();
                           var valid = _formKey.currentState.validate();
                            if(valid == true){
                                CurrentMedication _currentMedication = CurrentMedication(
                                    userId: "5e44126d243f4f795e8ef25b",
                                    pillName:_pillName,
                                    datePrescribed: _datePrescribed,
                                    dailyDosage :_dailyDosage,
                                    pharmaceutical: _pharmaceutical,
                                    frequency:_frequency
                                );
                                _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text("Sending data")));
                                _currentMedicationController.store(_currentMedication)
                                 .then((value) => {
                                  Fluttertoast.showToast(
                                    msg: value.toString(),
                                    toastLength: Toast.LENGTH_LONG,
                                    gravity: ToastGravity.CENTER,
                                    backgroundColor: Colors.green,
                                    textColor: Colors.white,
                                    fontSize: 16.0
                                ),
                                 Navigator.popAndPushNamed(context, ListCurrentMedicationRoute)
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
       formWidget.add(_pillNameWidget);
       formWidget.add(_dailyDosageWidget);
       formWidget.add(_pharmaceuticalWidget);
       formWidget.add(_frequencyWidget);
       formWidget.add(_submitButton);

      return formWidget;
   }

}