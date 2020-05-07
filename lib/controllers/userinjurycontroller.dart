import 'package:kalafidigitalhealthcard/models/userinjury.dart';
import 'package:kalafidigitalhealthcard/services/api_service.dart';

///Controllers should all be light weight passing and retriving data
class UserInjuryController{ 


  static store(UserInjury userInjury){ 
    ApiService  apiService= new ApiService();  

    apiService.postStoreUserInjury(userInjury).then((res)=>{
      res
    }).catchError((onError)=>{
      onError.toString()
    });
  } 

  static destroy(String storageId) async { 
     ApiService  apiService= new ApiService(); 

    await apiService.deleteUserInjury(storageId).then((res)=>{
      res
    }).catchError((onError)=>{
      onError.toString()
    }); 
  } 

  static getUserInjuries(String userId)async{ 
     ApiService apiService= new ApiService();  
    // List userIllness =[];

      await apiService.listUserInjury(userId).then((res)=>{
         res
      }).catchError((error)=>{
         print(error.toString())
      });
  } 

  static listInjuries()async{ 
     ApiService apiService= new ApiService(); 
      
      await apiService.getInjuryData().then((res)=>{
        res
      }).catchError((error)=>{
         print(error.toString())
      });
    
  }

}