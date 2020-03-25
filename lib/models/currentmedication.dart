import 'package:flutter/foundation.dart';

class CurrentMedication{ 
   String storageId; //object id in Mongo (4567twtewy67343)
   String  userId; 
   String pillName;  
   DateTime datePrescribed; 
   int dailyDosage;  
   String pharmaceutical; //person,company that gave the medication
  int frequency;//frequency (hours between medication)
  String get getStorageId =>storageId; 

  set setStorageId(String storageId){ 
    this.storageId=storageId;
  }
  String get getUserId => userId; 

  set setUserId(String  userId){ 
    this.userId =userId;
  } 

  String get getPillName => pillName; 

  set setPillName(String pillName){ 
    this.pillName =pillName;
  } 

  DateTime get getDatePrescribed => datePrescribed; 

  set setDatePrescribed(DateTime datePrescribed){
    this.datePrescribed =datePrescribed;
  } 

  int get getDailyDosage => dailyDosage; 

  set setDailyDosage(int dailyDosage){
    this.dailyDosage = dailyDosage;
  }  

  String get getPharmaceutical =>pharmaceutical; 

  set setPharmaceutical(String pharmaceutical){ 
    this.pharmaceutical= pharmaceutical;
  }
  int get getFrequency =>frequency; 

  set setFrequency(int frequency){ 
    this.frequency= frequency;
  }
  CurrentMedication({ 
     this.storageId, 
     @required this.userId, 
     @required this.pillName, 
     @required this.datePrescribed,  
     @required this.dailyDosage,  
     @required this.pharmaceutical,
    @required  this.frequency
  }); 
   factory CurrentMedication.fromJson(Map<String, dynamic>json){
    return CurrentMedication( 
       storageId : json['_id'],  
        userId: json['userId'],
       pillName: json['pillName'], 
       datePrescribed: json['datePrescribed'],
       dailyDosage: json['dailyDosage'], 
       pharmaceutical: json['pharmaceutical'],frequency: json['frequency']
     );
   } 

   Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();  
    data['storageId'] = this.storageId; 
    data['userId'] = this.userId; 
    data['pillName'] =this.pillName; 
    data['datePrescribed'] = this.datePrescribed; 
    data['dailyDosage'] = this.dailyDosage; 
    data['pharmaceutical'] =this.pharmaceutical; data['frequency'] =this.frequency;
    return data;
   }
   
  }