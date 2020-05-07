import 'package:kalafidigitalhealthcard/models/currentmedication.dart';
import 'package:kalafidigitalhealthcard/services/api_service.dart';

class CurrentMedicationController{ 

  static store(CurrentMedication currentMedication)async{ 
     ApiService  apiService= new ApiService(); 

     await apiService.postStoreCurrentMedication(currentMedication)
     .then((res)=>{ 
       res
     }).catchError((onError)=>{
       onError.toString()
     });  

  }  

  static getUserCurrentMedications(String userId) async {
     ApiService  apiService= new ApiService();  

     await apiService.listUserMedications(userId)
     .then((res)=>{
       res
     }).catchError((onError)=>{
       onError.toString()
     });
  }

  static destroy(String storageId)async{ 
     ApiService  apiService= new ApiService();  
     
     await apiService.deleteCurrentMedication(storageId)
      .then((res)=>{ 
       res
     }).catchError((onError)=>{
       onError.toString()
     }); 
  } 


}