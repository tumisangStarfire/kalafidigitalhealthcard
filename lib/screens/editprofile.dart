
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart'; 
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:kalafidigitalhealthcard/models/userprofile.dart';
import 'package:kalafidigitalhealthcard/widgets/app_card.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> { 
  final format = DateFormat("yyyy-MM-dd");
  UserProfile _profile;
  final _formKey = GlobalKey<FormState>(); 
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
        key:_scaffoldKey,  
      appBar: _buildAppBar(),
      body: Container(   
       
        decoration: BoxDecoration(color: Colors.blueGrey),
         child: ListView( 
           children: <Widget>[  
              SizedBox(height:18.0),
              
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
    );
  }  

   List<Widget> _getFormWidget() {  

    List<Widget> formWidget = new List();  
    List<String> _genders = ['Male', 'Female', 'Other', ]; // Option 2 
    List<String> _bloodTypes = ['A', 'B', 'AB', '0']; // Option 2
    String _selectedGender; // Option 2   
    String _selectedBloodType;  
    double bmi; 

     var _datePickerWidget = DateTimeField(
          format: format, 
          decoration: InputDecoration( 
           labelText: 'Date of Birth', 
           prefixIcon: Icon(Icons.cake,color:Colors.blueGrey), 
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
                    return 'Date of Birth';
                } 

          },
          onSaved: (value) {
          setState(() {
             _profile.setDateofBirth = value;
          });
        },
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

     var _weightWidget=new Container( 
       child: Padding(  
         padding: EdgeInsets.only(top: 10.0,bottom: 10.0),
         child: TextFormField( 
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
      ),
       ),
     );
     var _heightWidget = new Container(
       child: Padding( 
         padding: EdgeInsets.only(top: 10.0,bottom: 10.0), 
         child: TextFormField( 
        decoration: InputDecoration(
        labelText:"Height cm",  
        prefixIcon: Icon(Icons.healing,color:Colors.blueGrey), 
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
        ), 
       ),
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

    var _waistSizeWidget = new Container(  
      child: Padding(  
         padding: EdgeInsets.only(top: 10.0,bottom: 10.0), 
       child: TextFormField( 
          decoration: InputDecoration(
          labelText:"Waist Size", 
          prefixIcon: Icon(Icons.four_k,color:Colors.blueGrey), 
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

        
          onSaved: (value) {
            setState(() {
              _profile.setWaistSize =int.tryParse(value) ;
            }); 
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
                        onPressed: (){},
                        child: Text('Save')),
                    ); 
     
      formWidget.add(_datePickerWidget); 
      formWidget.add(_genderWidget); 
      formWidget.add(_bloodTypeWidget); 
      formWidget.add(_weightWidget); 
      formWidget.add(_heightWidget); 
      
      formWidget.add(_waistSizeWidget); 
       formWidget.add(_submitButton); 
     return formWidget;
   } 

    AppBar _buildAppBar() {
    return AppBar(
      leading: Builder( 
        builder:  (context) => IconButton(
          icon: Icon(Icons.menu),
          onPressed:(){ 
            Scaffold.of(context).openDrawer(); 
           //// _scaffoldKey.currentState.openDrawer();
           
        }),
      ),
      title: Text("Health Services"),  
      elevation: 0,
      actions: <Widget>[
        Icon(Icons.notifications),
        Container(
          width:50,
          alignment: Alignment.center, 
           
          child: Stack( 
            
            children:<Widget>[ 
              Container(  
                width: 35, 
                height:35,  
                decoration: BoxDecoration( 
                  shape:BoxShape.circle, 
                  color:Colors.grey, 
                  image:DecorationImage( 
                    fit:  BoxFit.cover, 
                     
                    image: NetworkImage("https://static1.squarespace.com/static/55f45174e4b0fb5d95b07f39/t/5aec4511aa4a991e53e6c044/1525433627644/Alexandra+Agoston+archives.jpg?format=1000w"),

                  )
                ),
               ) , 
              Positioned(
                bottom:0, 
                right:2,
                child: Container(
                  width:10, 
                  height:10, 
                  decoration:BoxDecoration(
                    shape:BoxShape.circle, 
                    color:Color(0xff00ff1d)
                  )
                )
              ), 
              
            ]
          ),
        ),  
        SizedBox(width:10),
      ],
    );   
  }


}