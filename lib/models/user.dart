
import 'package:flutter/foundation.dart';

class User{  

  String userId;
  String firstName; 
  String lastName; 
  int cellphone; 
  String email; 
  String password; 
  String status; 
  bool verified;

  String accessToken;

  DateTime expiresAt;   

  String get getUserId=>userId; 

  set setUserId(String userId){ 
    this.userId = userId; 

  }
  String get getFirstName => firstName; 

  set setFirstName (String firstName){ 
    this.firstName =firstName;
  } 

  String get getLastName => lastName;   

  set setLastName (String lastName){ 
    this.lastName =lastName;
  }   

  int get getCellphone =>cellphone; 

  set setCellphone(int cellphone){ 
    this.cellphone = cellphone;
  } 

  String get getEmail => email; 

  set setEmail(String email){ 
    this.email =email;
  } 

  String get getPassword =>password; 

  set setPassword(String password){ 
    this.password =password;
  }  

  User({ 
    this.userId,
    @required this.firstName, 
    @required this.lastName, 
    @required this.cellphone, 
    @required this.password,  
    this.email,
    this.status, 
    this.verified, 
    this.accessToken, 
    this.expiresAt
  });

  factory User.fromJson(Map<String,dynamic>json){  
    return User( 
           userId : json["_id"], 
          firstName :json["firstName"], 
          lastName : json["lastName"],
          cellphone :json["cellphone"],  
          password: json["password"],
          email : json["email"], 
          status: json["status"],
          verified: json["verified"]
    );
   
  }
 
   Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>(); 
    data['userId'] = this.userId; 
    data['firstName'] = this.firstName; 
    data['lastName'] = this.lastName; 
    data['cellphone'] = this.cellphone; 
    data['password'] = this.password; 
    data['email'] = this.email;
    data['status']=this.status;
    data['verified']=this.verified;
    return  data;
   }
}