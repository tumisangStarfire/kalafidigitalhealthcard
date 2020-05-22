import 'package:kalafidigitalhealthcard/models/healthfacility.dart';
import 'package:kalafidigitalhealthcard/services/api_service.dart';

class HealthFacilityController{
  final ApiService apiService=  ApiService();

 Future <List<HealthFacility>> listHealthFacilities() async{
    final response =  await apiService.getHealthFacilityData();
    return response;

  }

}