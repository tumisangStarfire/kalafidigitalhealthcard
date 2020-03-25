class VaccineType{ 
 
   String storageId; 
   String id;
   String typeofVaccine;
   String description; 

  VaccineType({ 
    this.storageId, 
    this.id, 
    this.typeofVaccine,  
    this.description
  }); 

  factory VaccineType.fromJson(Map<String, dynamic> json) {
	  return VaccineType(
      storageId : json['_id'],
      id : json['id'],
      typeofVaccine : json['typeofVaccine'], 
      description: json['description']
    );
		
	}  

  Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>(); 
    	data['storageId'] = this.storageId;
	  	data['id'] = this.id; 
      data['typeofVaccine'] =this.typeofVaccine; 
      data['description'] = this.description; 
      return data;
  }


  
}