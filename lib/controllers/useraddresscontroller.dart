import 'package:kalafidigitalhealthcard/models/address.dart';
import 'package:kalafidigitalhealthcard/services/api_service.dart';

class AddressController{ 

  static store(Address address) async{ 
     ApiService  apiService= new ApiService();    

    await  apiService.postAddress(address) 
    .then((res)=>{ 
      res
    }).catchError((onError)=>{
      onError.toString()
    });

  } 

  static update(String storageId,Address address)async{ 
     

     ApiService  apiService= new ApiService();    

    await  apiService.postUpdateAddress(storageId,address) 
    .then((res)=>{ 
      res
    }).catchError((onError)=>{
      onError.toString()
    });
  } 

  static getUserAddress(String userId)async{ 
    ApiService  apiService= new ApiService();    

    await  apiService.getUserAddress(userId) 
    .then((res)=>{ 
      res
    }).catchError((onError)=>{
      onError.toString()
    });
  }
}