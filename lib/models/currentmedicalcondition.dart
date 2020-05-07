import 'package:flutter/foundation.dart';
import 'package:kalafidigitalhealthcard/models/healthfacility.dart';

class CurrentMedicalCondition{ 

  String storageId; //object id in Mongo (4567twtewy67343)
  String  userId; 
  String conditionName;  
  DateTime dateOfDiagnosis;
  HealthFacility healthFacility;  


 String get getStorageId =>storageId; 

  set setStorageId(String storageId){ 
    this.storageId=storageId;
  }
  String get getUserId => userId; 

  set setUserId(String  userId){ 
    this.userId =userId;
  } 

  String get getConditionName => conditionName; 

  set setConditionName(String conditionName){ 
    this.conditionName =conditionName;
  }   

   DateTime get getDateOfDiagnosis => dateOfDiagnosis; 

  set setDateOfDiagnosis(DateTime dateOfDiagnosis){
    this.dateOfDiagnosis =dateOfDiagnosis;
  } 


 CurrentMedicalCondition({ 
    this.storageId, 
    this.userId,
    @required this.conditionName, 
    @required this.dateOfDiagnosis, 
    @required this.healthFacility, 
   
  }); 

 factory CurrentMedicalCondition.fromJson(Map<String,dynamic>json){  
    return CurrentMedicalCondition( 
           storageId : json["_id"], 
          userId :json["userId"], 
          conditionName : json["conditionName"],
          dateOfDiagnosis :json["dateOfDiagnosis"],  
          healthFacility : json['healthFacility'] != null ? new HealthFacility.fromJson(json['healthFacility']) : null,
         
    );
   
  } 

   Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();  
    data['storageId'] = this.storageId; 
    data['userId'] = this.userId; 
    data['conditionName'] = this.conditionName; 
    data['dateOfDiagnosis'] = this.dateOfDiagnosis;
   if (this.healthFacility != null) {
      data['healthFacility'] = this.healthFacility.toJson();
    }    
    return data;


   }
}