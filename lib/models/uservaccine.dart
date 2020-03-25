import 'package:kalafidigitalhealthcard/models/interfaces/healthfacilityInterface.dart';
import 'package:kalafidigitalhealthcard/models/vaccineType.dart';

class UserVaccine{ 
  String storageId;
  String userId;   
  DateTime dateAdministered; 
  HealthFacilityInterface healthfacility; 
  VaccineType vaccineType; 

  UserVaccine({
    this.storageId, 
    this.userId,  
    this.dateAdministered,  
    this.healthfacility,
    this.vaccineType

  }); 

  UserVaccine.fromJson(Map<String, dynamic> json) {
		storageId = json['_id'];
		userId = json['userId'];
		dateAdministered = json['dateAdministered'];
		healthfacility = json['healthfacility'];
		vaccineType = json['vaccineType'];
	}  

  Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['_id'] = this.storageId;
		data['userId'] = this.userId;
		data['dateAdministered'] = this.dateAdministered;
		data['healthfacility'] = this.healthfacility;
		data['vaccineType'] =this.vaccineType;
		return data;
	}



  
}