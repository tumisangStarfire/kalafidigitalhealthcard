import 'package:kalafidigitalhealthcard/models/userprofile.dart';
import 'package:kalafidigitalhealthcard/services/api_service.dart';

class UserProfileController{   


  static store(UserProfile userProfile){ 
     ApiService  apiService= new ApiService();  

    apiService.postStoreUserProfile(userProfile)
    .then((res)=>{ 
      res
    }).catchError((onError)=>{
        onError.toString()
    });
  }  

  static update(String storageId,UserProfile userProfile){ 
    ApiService  apiService= new ApiService();  

    apiService.postUpdateUserProfile(storageId,userProfile)
    .then((res)=>{ 
      res
    }).catchError((onError)=>{
        onError.toString()
    });
  } 

  static uploadProfilePicture(String base64Image,String userId){ 
       ApiService  apiService= new ApiService();  
       
       apiService.uploadProfilePicture(base64Image,userId)
       .then((res)=>{
         res
       }).catchError((onError)=>{ 
          onError.toString()
       });
  } 

  static getUserProfile(String userId){ 
     ApiService  apiService= new ApiService(); 

     apiService.getUserProfile(userId).then((res)=>{
       res
     }).catchError((onError)=>{  
       onError.toString()
     });
  }
}