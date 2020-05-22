
import 'package:flutter/foundation.dart';
import 'package:kalafidigitalhealthcard/models/illness.dart';
import 'package:kalafidigitalhealthcard/models/interfaces/vitalsInterface.dart';
import 'package:kalafidigitalhealthcard/models/pillprescription.dart';

import 'healthfacility.dart';

class UserIllness implements VitalsInterface{

  String storageId;//storage id object(353535swew)
  String userId;
  Illness typeOfIllness;
  DateTime dateOfDiagnosis;
  String doctorsNotes;
  List<PillPrescription> medicationPrescribed;
  HealthFacility healthFacility;

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

  Illness get getTypeOfIllness => typeOfIllness;

  set setTypeofIllness(Illness typeOfIllness){
    this.typeOfIllness = typeOfIllness;
  }

  DateTime get getDateOfDiagnosis => dateOfDiagnosis;

  set setDateOfDiagnosis(DateTime dateOfDiagnosis){
    this.dateOfDiagnosis=dateOfDiagnosis;
  }

  String get getDoctorsNotes => doctorsNotes;

  set setDoctorsNotes(String doctorsNotes){
    this.doctorsNotes =doctorsNotes;
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

  addIllnessPills(PillPrescription medicationPrescribed){
    this.medicationPrescribed.add(medicationPrescribed);
  }

  UserIllness({
    this.storageId,
    @required this.userId,
    @required this.typeOfIllness,
    @required this.dateOfDiagnosis,
    @required this.bloodPressure,
    @required this.temperature,
    this.doctorsNotes,
    this.pulseRate,
    this.recordedOn,
    this.medicationPrescribed,
    this.healthFacility
  });

   factory UserIllness.fromJson(Map<String, dynamic> json) {
      return UserIllness(
        	storageId : json['_id'],
          userId : json['userId'],
          typeOfIllness : json['typeOfIllness'],
          dateOfDiagnosis : json['dateOfDiagnosis'],
          bloodPressure : json['bloodPressure'],
          temperature : json['bloodPressure'],
          doctorsNotes : json['doctorsNotes'] != null ? json['doctorsNotes'] : null,
          pulseRate : json['pulseRate'] != null ? json['pulseRate' ] :null,
          medicationPrescribed : json['address'] !=null ? json['medicationPrescribed'] : null,
          healthFacility : json['healthFacility'] != null ? new HealthFacility.fromJson(json['healthFacility']) : null,
      );
   }

   Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
    data['storageId'] = this.storageId;
    data['userId'] = this.userId;
    data['typeOfIllness'] = this.typeOfIllness;
    data['dateOfDiagnosis'] = this.dateOfDiagnosis;
    data['bloodPressure'] = this.bloodPressure;
    data['bloodPressure'] = this.bloodPressure;
    data['doctorsNotes'] = this.doctorsNotes;
    data['pulseRate'] = this.pulseRate;
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