import 'package:kalafidigitalhealthcard/models/address.dart';

class HealthFacility {
	String storageId;//storage id object(353535swew)
	int id;
	String name;
	int region;
  double latitude;
  double longitude;
	Speciality speciality;
  Address address;

	HealthFacility({this.storageId, this.id, this.name, this.region,this.latitude,this.longitude,this.address, this.speciality});

	HealthFacility.fromJson(Map<String, dynamic> json) {
		storageId = json['_id'];
		id = json['id'];
		name = json['name'];
		region = json['region'];
    latitude = json['latitude'] != null ? json['latitude'] : null;
    longitude = json['longitude'] != null ? json['longitude' ] :null;
    address = json['address'] !=null ? new Address.fromJson(json['address']) : null;
		speciality = json['Speciality'] != null ? new Speciality.fromJson(json['Speciality']) : null;
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['storageId'] = this.storageId;
		data['id'] = this.id;
		data['name'] = this.name;
		data['region'] = this.region;
    data['latitude'] =this.latitude;
    data['longitude'] = this.longitude;
    if(this.address != null){
      data['address'] = this.address.toJson();
    }
		if (this.speciality != null) {
      data['Speciality'] = this.speciality.toJson();
    }
		return data;
	}

 @override
  String toString() {
    return '$id $name';
  }
}

class Speciality {


	Speciality();

	Speciality.fromJson(Map<String, dynamic> json) ;

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		return data;
	}
}
