import 'package:kalafidigitalhealthcard/models/apiresponse.dart';
import 'package:kalafidigitalhealthcard/models/currentmedicalcondition.dart';
import 'package:kalafidigitalhealthcard/services/api_service.dart';

class MedicationConditionController{
    final  ApiService  _apiService = ApiService();

  Future<ApiResponse> store(CurrentMedicalCondition currentMedicalCondition) async {

    final response = await _apiService.postStoreUserMedicalCondition(currentMedicalCondition);
    return response;
  }

  Future<List<CurrentMedicalCondition>> getUserMedicalConditions(String userId) async {
    final response = await _apiService.listUserMedicalConditions(userId);
    //print(response);
    return response;
  }

  Future<ApiResponse> destroy(String storageId)async{
     final response = await _apiService.deleteUserMedicalCondition(storageId);
     return response;

  }
}