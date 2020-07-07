import 'package:kalafidigitalhealthcard/models/apiresponse.dart';
import 'package:kalafidigitalhealthcard/models/illness.dart';
import 'package:kalafidigitalhealthcard/models/userillness.dart';
import 'package:kalafidigitalhealthcard/services/api_service.dart';

///Controllers should all be light weight passing and retriving data
class UserIllnessController{

 ApiService  _apiService=  ApiService();

  Future<ApiResponse> store(UserIllness  userIllness) async {

    final response = await _apiService.postStoreUserIllness(userIllness);
    return response;
  }

  Future<ApiResponse> destroy(String storageId) async{

    final response  = _apiService.deleteUserIllness(storageId);
     return response;
  }

  Future<List<UserIllness>> getUserIllness(String userId)async{

     final response = await _apiService.getUserIllness(userId);
      return response;
  }

  Future <List<Illness>> listillnesses()async{
    final response = await _apiService.getIllnessData();
    return response;

  }

}