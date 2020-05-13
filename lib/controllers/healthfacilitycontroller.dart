import 'package:kalafidigitalhealthcard/models/healthfacility.dart';
import 'package:kalafidigitalhealthcard/services/api_service.dart';

class HealthFacilityController{

 Future <List<HealthFacility>> listHealthFacilities()async{
     ApiService apiService= new ApiService();

      await apiService.getHealthFacilityData().then((res)=>{
        res
      }).catchError((error)=>{
         print(error.toString())
      });

  }
}