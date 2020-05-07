

import 'package:flutter/foundation.dart';
import 'package:kalafidigitalhealthcard/models/healthfacility.dart';
import './interfaces/vitalsInterface.dart';
import 'injury.dart';
import 'pillprescription.dart';

class UserInjury implements VitalsInterface{  
  
  String storageId;//storage id object(353535swew)
  String userId; 
  DateTime dateOfInjury; 
  List<PillPrescription> medicationPrescribed; 
  HealthFacility healthFacility;
  Injury  injurySustained;

  @override
  int bloodPressure;

  @override
  int pulseRate;

  @override
  DateTime recordedOn;

  @override
  double temperature;   

   String get getStorageId =>storageId; 

  set setStorageId(String storageId){ 
    this.storageId=storageId;
  }

  String get getUserId => userId; 

  set setUserId(String userId){
    this.userId = userId;
  }    


  DateTime get getDateofInjury => dateOfInjury; 

  set setDateofInjury(DateTime dateOfInjury){
    this.dateOfInjury =dateOfInjury;
  }

  int get getBloodPressure => bloodPressure; 

  set setBloodPressure(int bloodPressure){ 
    this.bloodPressure = bloodPressure;
  } 

  int get getPulseRate => pulseRate; 

  set setPulseRate(int pulseRate){ 
    this.pulseRate =pulseRate; 
  } 

  double get getTemperature => temperature; 

  set setTemperture(double temperature){ 
    this.temperature = temperature;
  } 

  DateTime get getRecordedOn => recordedOn; 

  set setRecordedOn(DateTime recordedOn){ 
    this.recordedOn = recordedOn;
  }   

  Injury  get getInjury =>  injurySustained; 

   set setInjury(Injury injurySustained){ 
    this.injurySustained = injurySustained;
  } 

  UserInjury({ 
    this.storageId, 
    @required this.userId, 
    @required this.dateOfInjury,   
    @required this.bloodPressure,    
    @required this.temperature,
    @required this.injurySustained,
    this.pulseRate,
    this.recordedOn, 
    @required this.medicationPrescribed, 
    this.healthFacility
   
  }); 

  factory UserInjury.fromJson(Map<String, dynamic> json) {
    return UserInjury(
      	storageId : json['_id'],  
        userId : json['userId'], 
        dateOfInjury: json['dateOfInjury'],
        bloodPressure : json['bloodPressure'],  
        temperature : json['temperature'], 
        injurySustained: new  Injury.fromJson(json['injurySustained']),  
        pulseRate: json['pulseRate'],
        recordedOn: json['recordedOn'], 
        medicationPrescribed : json['address'] !=null ? json['medicationPrescribed'] : null,
        healthFacility : json['healthFacility'] != null ? new HealthFacility.fromJson(json['healthFacility']) : null,

    );
  } 

  Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();  
    data['storageId'] = this.storageId; 
    data['userId'] = this.userId;  
    data['dateOfInjury'] = this.dateOfInjury; 
    data['bloodPressure'] = this.bloodPressure;
    data['temperature'] = this.temperature; 
    data['injurySustained'] = this.injurySustained; 
    data['pulseRate'] = this.pulseRate; 
     data['recordedOn'] = this.recordedOn;
    if (this.medicationPrescribed != null) {
      data['medicationPrescribed'] = getPillPrescriptions();
    }   
     if (this.healthFacility != null) {
      data['healthFacility'] = this.healthFacility.toJson();
    }    
    return data;
   }
  

   //method to add pill prescription to a list of meddication precribed
  void addPillPrescription(PillPrescription pillPrescription) {
        medicationPrescribed.add(pillPrescription);
  } 

  void removePillPrescription(PillPrescription pillPrescription){ 
       medicationPrescribed.remove(pillPrescription);
  } 

  List<PillPrescription> getPillPrescriptions(){ 
    return medicationPrescribed;
  }


 
  
}