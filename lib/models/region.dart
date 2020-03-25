
class Region{  
  String storageId;
  String regionId; 
  String regionName; 

  Region({  
    this.storageId, //id in Mongo db objectId('524138sfgshjkdsd')
    this.regionId, //id already preset 1
    this.regionName,
  });  

  

   factory Region.fromJson(Map<String, dynamic>json){
     return Region( 
       storageId:json['_id'],
       regionId : json['id'], 
       regionName: json['name']
     );
   }  

    Map<String, dynamic> toJson() { 
      final Map<String, dynamic> data = new Map<String,  dynamic>(); 
        data['_id'] = this.storageId;   
        data['id'] = this.regionId;  
         data['name'] = this.regionName;   
        return data;
    } 


}