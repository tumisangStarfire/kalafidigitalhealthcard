import 'package:kalafidigitalhealthcard/models/uservaccine.dart';
import 'package:kalafidigitalhealthcard/services/api_service.dart';

class UserVaccineController{ 
  

  static store(UserVaccine userVaccine) async { 
     ApiService  apiService= new ApiService(); 

     await apiService.postStoreUserVaccine(userVaccine) 
     .then((res)=>{ 
       res
     }).catchError((onError)=>{ 
       onError.toString() 
     });
  } 

  static getUserVaccines(String userId)async{ 
     ApiService  apiService= new ApiService();  

    await apiService.listUserVaccines(userId) 
     .then((res)=>{ 
       res
     }).catchError((onError)=>{ 
       onError.toString() 
     });

  } 

  static destroy(String storageId) async { 
     ApiService  apiService= new ApiService();  

    await apiService.deleteUserVaccine(storageId) 
     .then((res)=>{ 
       res
     }).catchError((onError)=>{ 
       onError.toString() 
     });
  } 

  static vaccineData() async {
     ApiService  apiService= new ApiService();  

     await apiService.getIllnessData() 
     .then((res)=>{ 
        res
     }).catchError((onError)=>{ 
       onError.toString() 
     });

  }
}