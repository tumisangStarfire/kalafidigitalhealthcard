import 'dart:convert';


import 'package:http/http.dart';
import 'package:kalafidigitalhealthcard/models/address.dart';
import 'package:kalafidigitalhealthcard/models/apiresponse.dart';
import 'package:kalafidigitalhealthcard/models/currentmedicalcondition.dart';
import 'package:kalafidigitalhealthcard/models/currentmedication.dart';
import 'package:kalafidigitalhealthcard/models/healthfacility.dart';
import 'package:kalafidigitalhealthcard/models/illness.dart';
import 'package:kalafidigitalhealthcard/models/injury.dart';

import 'package:kalafidigitalhealthcard/models/user.dart';
import 'package:kalafidigitalhealthcard/models/userillness.dart';
import 'package:kalafidigitalhealthcard/models/userinjury.dart';
import 'package:kalafidigitalhealthcard/models/userprofile.dart';
import 'package:kalafidigitalhealthcard/models/uservaccine.dart';
import 'package:kalafidigitalhealthcard/models/vaccine.dart';

class ApiService{
  final String url = "http://mookidigitalhealth-bw.com/v1/api";
 // final String url = "http://127.0.0.1:3000/v1/api";


  Future<User>login(int cellphone,String password) async {
    try{
         Map<String, String> headers = {"Content-type": "application/json"};
          var loginCredentials={
            "cellphone":cellphone,
            "password":password
          };

          Response res = await post(url+'/login',headers: headers,body: json.encode(loginCredentials));
          if(res.statusCode == 200){
            var user  =User.fromJson(json.decode(res.body));
            return user;
          }else{
            return json.decode(res.body.toString());
          }

    }catch(error){
      print(error);
    }

  }
  /// Create User
  Future<User> postRegister(User user) async{
    try{
      Map<String, String> headers = {"Content-type": "application/json"};

        Response res = await post(url+'/register',headers: headers,body: user.toJson());
        if(res.statusCode == 201){
          var user  =User.fromJson(json.decode(res.body));
          return user;
        }else{
          return json.decode(res.body.toString());
        }
    }catch(error){
      print(error);
    }

  }

  ///create user address
  Future<Address>postAddress(Address address)async{
    try{
        Map<String, String> headers = {"Content-type": "application/json"};

        Response res = await post(url+'/register',headers: headers,body: address.toJson());
        if(res.statusCode == 201){
          var address  =Address.fromJson(json.decode(res.body));
          return address;
        }else{
          return json.decode(res.body.toString());
        }
    }catch(error){
      print(error);
    }
  }

  ///create user address
  Future<Address>postUpdateAddress(String storageId,Address address)async{
    try{
        Map<String, String> headers = {"Content-type": "application/json"};

        Response res = await post(url+"/register/$storageId",headers: headers,body: address.toJson());
        if(res.statusCode == 201){
          var address  =Address.fromJson(json.decode(res.body));
          return address;
        }else{
          return json.decode(res.body.toString());
        }
    }catch(error){
      print(error);
    }
  }


  //get user address using userId
   Future <Address> getUserAddress(userId) async{
    try{
        Response res = await get(url+"/getUserAddress/$userId");

         if(res.statusCode == 200){
          var address  =Address.fromJson(json.decode(res.body));
          return address;
        }else{
          return json.decode(res.body.toString());
        }

    }catch(error){
        print(error);
    }
  }

  //get User account

  Future <User> getUser(userId) async{
    try{
         await get(url+"/getUser/$userId")
        .then((res)=>{
           User.fromJson(json.decode(res.body.toString()))
        }).
        catchError((onError)=>{
          onError.toString()
        });

    }catch(error){
        print(error);
    }
  }


  //postCreatePofile,

  Future<UserProfile> postStoreUserProfile(UserProfile userProfile) async {
    try{
         Map<String, String> headers = {"Content-type": "application/json"};
          Response  res = await post(url+'/createUserProfile',headers:headers,body: userProfile.toJson());

          if(res.statusCode == 200){
            return  UserProfile.fromJson(json.decode(res.body.toString()));
          }else{
            return json.decode(res.body);
          }

    }catch(error){
      print(error);
    }


  }

  //update profile
  Future<UserProfile> postUpdateUserProfile(String storageId,UserProfile userProfile)async{
    try{
       Map<String, String> headers = {"Content-type": "application/json"};
     Response  res = await post(url+'/updateUserProfile/'+storageId,headers:headers,body: userProfile.toJson());

      if(res.statusCode == 200){
        return UserProfile.fromJson(json.decode(res.body.toString()));
      }else{
        return json.decode(res.body.toString());
      }

    }catch(error){
      print(error);
    }


  }

    //upload Users profile picture, profile picyure should be a 64bit encoded file
  Future<dynamic> uploadProfilePicture(String profilePicture,String userId) async {
    try{
         Map<String, String> headers = {"Content-type": "application/json"};

        Map<String, String> body={
            'profilePicture':profilePicture ,
            'userId':userId
        };
       await post(url+'/uploadProfilePicture',headers: headers,body:json.encode(body))
        .then((res)=>{
           res.body.toString()
        }).catchError((onError)=>{
            onError.toString()
        });

    }catch(error){
       print(error);
    }

  }

  Future <UserProfile> getUserProfile(userId) async{
    try{
         await get(url+"/getUserProfile/$userId")
        .then((res)=>{
           UserProfile.fromJson(json.decode(res.body.toString()))
        }).
        catchError((onError)=>{
          onError.toString()
        });

    }catch(error){
        print(error);
    }
  }


  //save currrent prescribed medication
  Future<ApiResponse> postStoreCurrentMedication(CurrentMedication currentMedication)async{
    try{
        Map<String, String> headers = {"Content-type": "application/json"};
     Response res = await post(url+"/saveCurrentMedication",headers: headers,body:currentMedication.toJson());

        if(res.statusCode == 200){
          return json.decode(res.body);
        }else{
          return json.decode(res.body);
        }
    }catch(error){
      print(error);
    }

  }

  //remove current medication
  Future<ApiResponse> deleteCurrentMedication(String storageId)async{
    try{
        String deleteUrl =url+'/deleteCurrentMedication';
     Response res = await delete("$deleteUrl+/$storageId");
        if (res.statusCode == 200) {
         return json.decode(res.body.toString());
        } else {
          return json.decode(res.body.toString());
        }
    } catch(error){
      print(error);
    }

  }

  /// create Vaccination
  Future<UserVaccine> postStoreUserVaccine(UserVaccine userVaccine) async{
     Map<String, String> headers = {"Content-type": "application/json"};

     Response res = await post(url+'/createVaccination',headers: headers,body: userVaccine.toJson());
      if(res.statusCode == 200){
      return json.decode(res.body.toString());
    }else{
       throw "Failed to store user vaccine";
    }
  }



  ///remove vaccine
  Future<String> deleteUserVaccine(String storageId)async{
      String deleteUrl =url+'/deleteVaccination';
     Response res = await delete("$deleteUrl+/$storageId");

     if (res.statusCode == 200) {
        return json.decode(res.body.toString());
    } else {
      throw "Can't delete vaccine.";
    }
  }

   Future<UserIllness> postStoreUserIllness(UserIllness userIllness)async{
     try{
       Map<String, String> headers = {"Content-type": "application/json"};

      Response res = await post(url+'/createIllness',headers: headers,body: userIllness.toJson());
      if(res.statusCode == 200){
          return UserIllness.fromJson(json.decode(res.body.toString()));
        }else{
            return json.decode(res.body.toString());
        }
        }catch(error){
           print(error);
        }

   }

   Future<UserIllness> getUserIllness(String userId)async{
      try{
           Response res = await get(url+"/userIllnessData/$userId");

          if(res.statusCode == 200){
            return UserIllness.fromJson(json.decode(res.body.toString()));
          }else{
            return json.decode(res.body);
          }
      }catch(error){
         print(error);
      }

   }

    ///remove user illness
  Future<String> deleteUserIllness(String storageId)async{
    try{
        String deleteUrl =url+'/deleteIllness';
        Response res = await delete("$deleteUrl+/$storageId");

        if (res.statusCode == 200) {
            return json.decode(res.body.toString());
        } else {
          return "Something went wrong please try again";
        }


    }catch(error) {
      print(error);
    }

  }

   Future<UserInjury> postStoreUserInjury(UserInjury userInjury)async{
     Map<String, String> headers = {"Content-type": "application/json"};

     Response res = await post(url+'/createInjury',headers: headers,body: userInjury.toJson());
     if(res.statusCode == 200){
        return json.decode(res.body.toString());
      }else{
        return json.decode(res.body.toString());
      }
   }

   Future<ApiResponse> postStoreUserMedicalCondition(CurrentMedicalCondition currentMedicalCondition)async{
     try{

        Map<String, String> headers = {"Content-Type": "application/json"};

      Response res = await post(url+'/saveCurrentMedicalCondition',headers: headers,body: json.encode(currentMedicalCondition.toJson()));
      if(res.statusCode == 200){
           return ApiResponse.fromJson(json.decode(res.body.toString()));
        }else{
          return json.decode(res.body.toString());
        }

     }catch(error){
       print(error);
     }

   }

     ///remove user medical condition
  Future<ApiResponse> deleteUserMedicalCondition(String storageId)async{
    try{
        String deleteUrl =url+'/deleteUserMedicalCondition';
        Response res = await delete("$deleteUrl+/$storageId");

        if (res.statusCode == 200) {
            return ApiResponse.fromJson(json.decode(res.body));
        } else {
           return ApiResponse.fromJson(json.decode(res.body));
        }


    }catch(error) {
      print(error);
    }

  }

    Future<List<UserInjury>> listUserInjury(String userId)async{
      try{
           Response res = await get(url+"/userInjuryData/$userId");

          if(res.statusCode == 200){
            List <dynamic> userInjury = json.decode(res.body);
            List<UserInjury> data = userInjury.map((dynamic item) => UserInjury.fromJson(item)).toList();
              return data;

          }else{
            throw "Failed to get user illness";
          }
      }catch(error){
        print(error);
      }

   }

    Future<String> deleteUserInjury(String storageId)async{
      String deleteUrl =url+'/deleteInjury';
     Response res = await delete("$deleteUrl/$storageId");

     if (res.statusCode == 200) {
        return json.decode(res.body.toString());
    } else {
      throw "Can't delete injury.";
    }
  }



  Future <List<CurrentMedication>> listUserMedications(String userId) async {
    try{
         Response res = await get(url+"/listUserMedications/$userId");

        if(res.statusCode == 200 ){
          List <dynamic> userMedications = json.decode(res.body);
          List<CurrentMedication> data = userMedications.map((dynamic item) => CurrentMedication.fromJson(item)).toList();
          return data;
        }else{
          return json.decode(res.body);
        }
    }catch(error){
      print(error);
    }

  }

   Future <List<CurrentMedicalCondition>> listUserMedicalConditions(String userId) async {
    try{
         Response res = await get(url+"/listUserMedicalConditions/$userId");

        if(res.statusCode == 200 ){
          List <dynamic> medicalConditions = json.decode(res.body);
          List<CurrentMedicalCondition> data = medicalConditions.map((dynamic item) => CurrentMedicalCondition.fromJson(item)).toList();
          return data;
        }else{
          return json.decode(res.body);
        }
    }catch(error){
      print(error);
    }

  }


   Future <List<UserVaccine>> listUserVaccines(String userId) async {
    try{
         Response res = await get(url+"/listUserVaccines/$userId");

        if(res.statusCode == 200 ){
          List <dynamic> uservaccines = json.decode(res.body);
          List<UserVaccine> data = uservaccines.map((dynamic item) => UserVaccine.fromJson(item)).toList();
          return data;
        }else{
          return json.decode(res.body);
        }
    }catch(error){
      print(error);
    }

  }

Future <List<HealthFacility>> getHealthFacilityData() async  {
    try{
      Response res = await get(url+'/healthFacilityData');

      if(res.statusCode ==200 ){
        List <dynamic> healthfacilitydata =json.decode(res.body.toString());
       // print(healthfacilitydata);
        List<HealthFacility> data = healthfacilitydata.map((dynamic item) => HealthFacility.fromJson(item)).toList();
        return data;
      }else{
        return json.decode(res.body);
      }
    }catch(error){
         print(error);
    }

  }

  //TO DO: review codebb
  Future <List<Illness>> getIllnessData() async {
    try{
        Response res = await get(url+'/getAPIIllness');
        if(res.statusCode == 200){
          List<dynamic> illnessData = json.decode(res.body);
          List<Illness> data = illnessData.map((dynamic item) =>Illness.fromJson(item)).toList();
          print(data);
          return data;
        }else{
          return json.decode(res.body);
        }
    }catch(error){
      print(error);
    }

  }

  Future<List<Injury>> getInjuryData() async {
    try{
        Response res = await get(url+'/getAllInjuryData');
        if(res.statusCode == 200){
          List<dynamic> injuryData = json.decode(res.body);

          List<Injury> data = injuryData.map((dynamic item) =>Injury.fromJson(item)).toList();
          return data;
        }else{
           return json.decode(res.body);
        }
    }catch(error){
       print(error);
    }


  }

  Future<List<Vaccine>> getVaccineData() async{
    try{
          Response res = await get(url+'/getAllVaccineData');
          if(res.statusCode == 200){
            List<dynamic>  vaccineData = json.decode(res.body);
            List<Vaccine> data = vaccineData.map((dynamic item) =>Vaccine.fromJson(item)).toList();
            return data;
          }else{
            return json.decode(res.body);
          }
    }catch(error){
       print(error);
    }

  }




}