import 'package:kalafidigitalhealthcard/services/api_service.dart';

class HealthFacilityController{

  static listHealthFacilities()async{ 
     ApiService apiService= new ApiService(); 
      
      await apiService.getHealthFacilityData().then((res)=>{
        res
      }).catchError((error)=>{
         print(error.toString())
      });
    
  }
}  