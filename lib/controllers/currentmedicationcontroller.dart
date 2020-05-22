import 'package:kalafidigitalhealthcard/models/apiresponse.dart';

import 'package:kalafidigitalhealthcard/models/currentmedication.dart';
import 'package:kalafidigitalhealthcard/services/api_service.dart';

class CurrentMedicationController{
   ApiService  _apiService=  ApiService();

  Future<ApiResponse> store(CurrentMedication currentMedication)async{

     final response = await _apiService.postStoreCurrentMedication(currentMedication);
     return response;
  }

  Future<List<CurrentMedication>> getUserCurrentMedications(String userId) async {

    final response =await _apiService.listUserMedications(userId);
    return response;

  }

  Future<ApiResponse> destroy(String storageId)async{

     final response =await _apiService.deleteCurrentMedication(storageId);
    return response;

  }


}