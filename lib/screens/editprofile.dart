

import 'package:flutter/material.dart';
import 'package:kalafidigitalhealthcard/models/userprofile.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> { 
  var _dateValue; 
  UserProfile _profile;
  final _formKey = GlobalKey<FormState>(); 

  

  Future _selectDate() async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2016),
        lastDate: new DateTime(2019)
    );
    if(picked != null) setState(() => _dateValue = picked.toString());
}
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
    List<String> _genders = ['Male', 'Female', 'Other', ]; // Option 2 
    List<String> _bloodTypes = ['A', 'B', 'AB', '0']; // Option 2
    String _selectedGender; // Option 2   
    String _selectedBloodType;  
    double bmi; 

     

     var dob = InkWell(
        onTap: () {
          _selectDate();   // Call Function that has showDatePicker()
        },
        child: IgnorePointer(
          child: new TextFormField(
            decoration: new InputDecoration(hintText: '1990-06-12'),
            maxLength: 10,
            // validator: validateDob,
            onSaved: (val) {
              _profile.setDateofBirth = val as DateTime;
            },
          ),
        ),
      );

     var _genderWidget = DropdownButton(
        hint: Text('Please select your gender'), 
        value: _selectedGender,
        onChanged: (newValue) {
          setState(() {
             _profile.setGender = newValue;
          });
        },
       items: _genders.map((genderData) {
        return DropdownMenuItem(
          child: new Text(genderData),
            value: genderData,
         );
        }).toList(),
    );    

    var _bloodTypeWidget = DropdownButton(
        hint: Text('Please select your blood Type'), 
        value: _selectedBloodType,
        onChanged: (newValue) {
          setState(() {
             _profile.setBloodType = newValue;
          });
        },
       items: _bloodTypes.map((bloodTypeData) {
        return DropdownMenuItem(
          child: new Text(bloodTypeData),
            value: bloodTypeData,
         );
        }).toList(),
    );   

     var _weightWidget=new TextFormField( 
        decoration: InputDecoration(
          labelText:"Weight kg", 
          prefixIcon: Icon(Icons.hourglass_empty,color:Colors.blueGrey), 
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
                return 'weight is required';
             } 
             
        }, 
        onSaved: (value) {
          setState(() {
              _profile.setWeight  =double.tryParse(value) ;
          }); 
        },
      );  
     var _heightWidget =new TextFormField( 
        decoration: InputDecoration(
        labelText:"Height cm", 
        //prefixIcon: Icon(Icons.,color:Colors.blueGrey),
        ),  
        validator: (value){ 
             if(value.trim().isEmpty){ 
                return 'height is required';
             } 
             
        }, 
        onSaved: (value) {
          setState(() {
              _profile.setHeight = double.tryParse(value) ;
          }); 
        },
      );  

     var _bmiWidget= new TextFormField( 
        decoration: InputDecoration(
        labelText:"Bdy Mass Index ", 
        //prefixIcon: Icon(Icons.,color:Colors.blueGrey),
        ),  
        
        onSaved: (value) {
          setState(() {
              bmi =_profile.calculateBMI(_profile.getWeight, _profile.getHeight);
          }); 
        },
      );  
;   
    var _waistSizeWidget = new TextFormField( 
        decoration: InputDecoration(
        labelText:"Waist Size ", 
        prefixIcon: Icon(Icons.hourglass_empty,color:Colors.blueGrey),
        ),  
      
        onSaved: (value) {
          setState(() {
             _profile.setWaistSize =int.tryParse(value) ;
          }); 
        },
      );  
     

     return formWidget;
   }


}