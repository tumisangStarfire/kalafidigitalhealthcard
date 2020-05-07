import 'package:kalafidigitalhealthcard/models/user.dart';
import 'package:kalafidigitalhealthcard/services/api_service.dart';

class UserController{ 


 static Future<User>  login(int cellphone,String password) async { 
    ApiService  apiService= new ApiService();
    var response  = await apiService.login(cellphone, password);   
    
    if(response==null){ 
       return null; 
    }  
     User user= response;
    return user;
  } 
  
  static Future<User>  register(String firstName,String lastName,int cellphone,String password) async { 
    ApiService  apiService= new ApiService(); 
    User user; 
    user.setFirstName=firstName; 
    user.setLastName=lastName;
    user.setCellphone=cellphone;
    user.setPassword='tempPassword';

    var response  = await apiService.postRegister(user);   
    
    if(response==null){ 
       return null; 
    }  
     User retrievedUser= response;
    return retrievedUser;
  } 

  static Future<String>createPassword(String password,String  confirmPassword){ 

    return null; 
  } 


}