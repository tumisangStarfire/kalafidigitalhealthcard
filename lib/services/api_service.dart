import 'dart:convert'; 


import 'package:http/http.dart';
import 'package:kalafidigitalhealthcard/models/currentmedication.dart';
import 'package:kalafidigitalhealthcard/models/healthfacility.dart';
import 'package:kalafidigitalhealthcard/models/illness.dart';
import 'package:kalafidigitalhealthcard/models/injury.dart';

import 'package:kalafidigitalhealthcard/models/user.dart';
import 'package:kalafidigitalhealthcard/models/userprofile.dart';

class ApiService{ 
  final String url = "http://mookidigitalhealth-bw.com/v1/api"; 

  /// Create User 
  Future<String> postRegister(User user) async{  
     Map<String, String> headers = {"Content-type": "application/json"};
     
    Response res = await post(url+'/register',headers: headers,body: user.toJson()); 
    if(res.statusCode == 201){  

      return json.decode(res.body);
    }else{ 
      throw "Registration error";
    }
  } 

  //get User account 

  Future <User> getUser(userId) async{ 
    Response res = await get(url+"/getUser/$userId");  

    if(res.statusCode == 200){ 
      return User.fromJson(json.decode(res.body));
    }else{ 
      throw "Failed to get user error";
    }


  } 
  //postCreatePofile,

  Future<UserProfile> postStoreUserProfile(UserProfile userProfile) async {
     Map<String, String> headers = {"Content-type": "application/json"}; 
     Response  res = await post(url+'/createUserProfile',headers:headers,body: userProfile.toJson()); 

    if(res.statusCode == 201){  

      return json.decode(res.body);
    }else{ 
      throw "failed to create profile";
    }

  }



    //upload Users profile picture, profile picyure should be a 64bit encoded file
  Future<dynamic> uploadProfilePicture(profilePicture,userId)async{ 
     Map<String, String> headers = {"Content-type": "application/json"}; 

    var body = json.encode({ 
        'profilePicture':profilePicture ,
        'userId':userId
    });
    Response res = await post(url+'/uploadProfilePicture',headers: headers,body:body); 

    if(res.statusCode == 200){ 
      return json.decode(res.body);
    }else{ 
       throw "Failed to update profile picture";
    }
  }  

  //save currrent prescribed medication 
  Future<dynamic> postStoreCurrentMedication(CurrentMedication currentMedication)async{ 
     Map<String, String> headers = {"Content-type": "application/json"}; 
     Response res = await post(url+"/saveCurrentMedication",headers: headers,body:json.encode(currentMedication.toJson()));  

    if(res.statusCode == 200){ 
      return json.decode(res.body);
    }else{ 
       throw "Failed to store current medication";
    }
  } 

  //remove current medication
  Future<String> deleteCurrentMedication(currentMedicationId)async{ 
         Map<String, String> headers = {"Content-type": "application/json"};
    Response res = await delete(url+"removeCurrentMedication/$currentMedicationId",headers: headers); 
    if (res.statusCode == 200) {
     return "Deleted successful";
    } else {
      throw "Can't delete medication.";
    }
  }

  Future <List<HealthFacility>> getHealthFacilityData()async{
     Response res = await get(url+'/healthFacilityData'); 

     if(res.statusCode ==200){ 
       List <dynamic> healthfacilitydata =json.decode(res.body); 
       List<HealthFacility> data = healthfacilitydata.map((dynamic item) => HealthFacility.fromJson(item)); 
       return data;
     }else{ 
       throw "Failed to fetch health facility data";
     }
  } 

  //TO DO: review codebb   
  Future<List<Illness>> getIllnessData() async{   
  
    Response res = await get(url+'/getAPIIllness'); 
    if(res.statusCode == 200){ 
      List<dynamic> illnessData = json.decode(res.body);

      List<Illness> data=illnessData.map((dynamic item) =>Illness.fromJson(item));
      return data;
    }else{ 
      throw "Can't get illness data";
    }
      
  }  

  Future<Injury> getInjuryData() async{ 
    Response res = await get(url+'/getAllInjuryData');  
    if(res.statusCode == 200){ 
      var injuryData = json.decode(res.body);
      return Injury.fromJson(injuryData);
    }else{ 
      throw "Can't get illness data";
    }

  } 

 

  
}