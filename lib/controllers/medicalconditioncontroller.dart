import 'package:kalafidigitalhealthcard/models/currentmedicalcondition.dart';
import 'package:kalafidigitalhealthcard/services/api_service.dart';

class MedicationConditionController{ 

  static store(CurrentMedicalCondition currentMedicalCondition) async { 
    ApiService  apiService= new ApiService();  

    await apiService.postStoreUserMedicalCondition(currentMedicalCondition).then((res)=>{ 
      res
    }).catchError((onError)=>{ 
      onError.toString()
    }); 

  }   

   static getUserMedicalConditions(String userId) async {
     ApiService  apiService= new ApiService();  

     await apiService.listUserMedicalConditions(userId)
     .then((res)=>{
       res
     }).catchError((onError)=>{
       onError.toString()
     });
  }

  static destroy(String storageId)async{ 
    ApiService  apiService= new ApiService(); 

     await apiService.deleteUserMedicalCondition(storageId).then((res)=>{ 
        res
      }).catchError((onError)=>{ 
        onError.toString()
      }); 
  }
} 