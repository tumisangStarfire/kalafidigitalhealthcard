
import 'package:kalafidigitalhealthcard/models/region.dart';

class Address{  
   
    String storageId;// storageid in mongo (2233ewssddsd)
    String city; 
    String town; 
    String village; 
    String streetName; 
    int houseNumber;  
    String ward; 
    Region region; //every address as a Region

      

  String get getStorageId =>storageId; 

  set setStorageId(String storageId){ 
    this.storageId=storageId;
  }
  
  String get getCity =>city; 

  set setCity(String city){ 
    this.city = city;
  } 

  String get getTown =>town; 

  set setTown(String town){ 
    this.town =town;
  } 

  String get getVillage => village; 

  set setVillage(String village){ 
    this.village =village;
  }  

  String get getStreetName =>streetName; 

  set setStreetName(String streetName){ 
    this.streetName = streetName;
  } 

  int get getHouseNumber => houseNumber;

  set setHouseNumber(int houseNumber){ 
    this.houseNumber =houseNumber;
  } 

  Address({ 
    this.storageId, 
    this.city,
    this.town, 
    this.streetName, 
    this.houseNumber, 
    this.village, 
    this.ward, 
    this.region

  }); 
  ///check for the addrees variables, also check if they are empty
  factory Address.fromJson(Map<String, dynamic>json){
    return Address( 
      	storageId : json['_id'],  
        city:  json['city']  != null ? json['city'] : null , 
        town: json['town'] != null ? json['town'] :null, 
        village:  json['village'] != null ? json['village'] :null,  
        streetName:  json['streetName'] != null ? json['streetName'] :null, 
        ward :  json['ward'] != null ? json['ward'] :null, 
        region:  json['region'] != null ? json['region'] :null,
      
    );
   }

  Map<String, dynamic> toJson() { 
    final Map<String, dynamic> data = new Map<String,  dynamic>(); 
    data['storageId'] = this.storageId; 
    data['city'] =this.city; 
    data['town'] =this.town; 
    data['village'] = this.village; 
    data['streetName'] =this.streetName; 
    data['ward'] =this.ward; 
    data['region'] = this.region;
    return data;
  }

  

  
    
}