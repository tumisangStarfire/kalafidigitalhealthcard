import 'package:kalafidigitalhealthcard/models/illness.dart';
import 'package:kalafidigitalhealthcard/models/userillness.dart';
import 'package:kalafidigitalhealthcard/services/api_service.dart';

///Controllers should all be light weight passing and retriving data
class UserIllnessController{ 
   
  
  static store(UserIllness  userIllness) async { 

     ApiService  apiService= new ApiService(); 
      await apiService.postStoreUserIllness(userIllness)
     .then((res)=>{ 
       //responseMessage. 
        res.toJson()
     }).
     catchError((onError)=>{ 
       print(onError.toString())
     });   
       
  } 

  static destroy(String storageId) async{ 

     ApiService apiService= new ApiService(); 

      await apiService.deleteUserIllness(storageId)
      .then((res)=>{  
          res.toString()
      }) 
      .catchError((error)=>{
         print(error.toString())
      });
  }  

  static getUserIllness(String userId)async{ 
     ApiService apiService= new ApiService();  
    // List userIllness =[];

      await apiService.getUserIllness(userId).then((res)=>{
         res
      }).catchError((error)=>{
         print(error.toString())
      });
  } 

  static listillnesses()async{ 
     ApiService apiService= new ApiService(); 
      
      await apiService.getIllnessData().then((res)=>{
        res
      }).catchError((error)=>{
         print(error.toString())
      });
    
  }
  
}