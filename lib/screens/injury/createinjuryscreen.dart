import 'package:flutter/material.dart';
import 'package:kalafidigitalhealthcard/widgets/app_card.dart';
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
  //list of widgets to be added to the form
   List<Widget> _getFormWidget() {
     List<Widget> formWidget = new List();
      List<DropdownMenuItem>injuriesTemp =[];
      injuriesTemp.add(DropdownMenuItem(child:Text('head injury'),value:'head  injury'));
      injuriesTemp.add(DropdownMenuItem(child:Text('broken arm'),value:'broken arm'));
      //List<DropdownMenuItem>medicationsTemp=[{'name':'panado'},{'name':'paracetamol'},{'name':'anti-inflamatory'}];
      var selectedItems=[];
      var selectedInjury=' ';

       List<DropdownMenuItem>hospitalTemp =[];
      hospitalTemp.add(DropdownMenuItem(child:Text('Marina'),value:'Marina'));
      hospitalTemp.add(DropdownMenuItem(child:Text('Gaborone Private Hospital'),value:'Gaborone Private Hospital'));
      var selected = ' ';

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
             userInjury.setDateofInjury = value;
          });
        },
       )
      ),
    );

     var _bloodPressureWidget = new Container(
       child: Padding(
         padding: EdgeInsets.only(top: 10.0,bottom: 10.0),
          child : TextFormField(
          decoration: InputDecoration(
            labelText:"Enter BP",
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
        )
       ),
     );

      var _temperatureWidget=new Container(
        child: Padding(
          padding: EdgeInsets.only(top: 10.0,bottom: 10.0),
          child : TextFormField(
            decoration: InputDecoration(
              labelText:"Enter Temperature",
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
          )
        )
      );

       var _pulseRateWidget=new Container(
         child : Padding(
             padding: EdgeInsets.only(top: 10.0,bottom: 10.0),
            child: TextFormField(
            decoration: InputDecoration(
              labelText:"Enter Pulse Rate",
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
            onSaved: (value) {
              setState(() {
                userInjury.setPulseRate = int.tryParse(value);
              });
            },
          )
         )
       );

       var _vitalsRecordedOnWidget=new TextFormField(
        decoration: InputDecoration(
          labelText:"Vitals Recorded  on"),
        onSaved: (value) {
          setState(() {
             userInjury.setRecordedOn = int.tryParse(value) as DateTime;
          });
        },
       );

      var _injuriesWidget= new Container(
        child: Padding(
          padding: EdgeInsets.only(top: 10.0,bottom: 10.0),
          child: SearchableDropdown.single(
            items: injuriesTemp,
            value:selectedInjury ,
            hint: "Select Injury",
            searchHint: "type/name",

            onChanged: (value) {
            setState(() {
              userInjury.setUserId  = value;
            });
          },
          isExpanded: true,
        ),
        ),
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
      );*/

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
              userInjury.healthFacility.name = value;
            });
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
                  userInjury.setDoctorsNotes = value;
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
    formWidget.add(_injuriesWidget);
    formWidget.add(_bloodPressureWidget);
    formWidget.add(_temperatureWidget);
    formWidget.add(_pulseRateWidget);
    formWidget.add(_doctorsNotesWidget);
    formWidget.add(_submitButton);

    return formWidget;
   }
}