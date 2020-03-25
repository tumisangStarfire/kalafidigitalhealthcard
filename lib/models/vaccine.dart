
import 'package:kalafidigitalhealthcard/models/vaccineType.dart';

class Vaccine{ 
  String storageId; 
  String id; 
  String name; 
  VaccineType vaccineType; 

  Vaccine({ 
    this.storageId, 
    this.id, 
    this.name,  
    this.vaccineType
  }); 

  factory Vaccine.fromJson(Map<String, dynamic> json) {
	  return Vaccine(
      storageId : json['_id'],
      id : json['id'],
      name : json['name'], 
      vaccineType:new VaccineType.fromJson( json['vaccineType'])
    );
		
	}   

  Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>(); 
    	data['storageId'] = this.storageId;
	  	data['id'] = this.id; 
      data['name'] =this.name; 
      data['vaccineType'] = this.vaccineType; 
      return data;
  }
  
}