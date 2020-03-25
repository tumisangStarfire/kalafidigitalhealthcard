
import 'package:flutter/foundation.dart';
//an interface to be implemented by othe classes
///This class will be used to define pills Given to an injury or illness,
class PillPrescription{  

  String pillName; 
  DateTime datePrescribed;
  int dailyDosage; 
  int numberOfPillsGiven; 
  int numberOfPillsUsed; 

  PillPrescription({ 
    @required this.pillName, 
    @required this.datePrescribed, 
    @required this.dailyDosage, 
    this.numberOfPillsGiven,
    this.numberOfPillsUsed
  }); 

  getRemainingPills(int numberOfPillsGiven, int numberOfPillsUsed) {
    int result = numberOfPillsGiven - numberOfPillsUsed;
    return result;
  }
  
}