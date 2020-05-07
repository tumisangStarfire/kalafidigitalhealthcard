import 'dart:async';


import 'package:flutter/cupertino.dart';
import 'package:kalafidigitalhealthcard/controllers/usercontroller.dart';
import 'package:kalafidigitalhealthcard/models/user.dart';

class AuthProvider with ChangeNotifier{ 

  String _token; 
  DateTime _expiryDate; 
  User _user; 
  bool _isOTPVerified=false; 
  Timer _authTimer;

  bool get isAuthenticated{ 
    print(_token != null && _isOTPVerified ); 
    return  _token != null && _isOTPVerified;
  } 
  
  String get getToken{ 
    if(_expiryDate!=null&&_expiryDate.isAfter(DateTime.now())&&_token!=null)
      return _token; 

    return null; 
  }

  User get getUser{ 
    return _user;
  }  
   
  Future<User>auth(int  cellphone,String  password ) async { 
    var response  = await UserController.login(cellphone,password);  

    if(response==null) 
      return null; 

    var user =  response; 
    // User.fromJson(response);  
    _token = user.accessToken;    
    _expiryDate=user.expiresAt;
    _user=user;  
    notifyListeners(); 

    /*var pref =  await SharedPreferences.getInstance(); 
        pref.SetString('userData',json.encode(user.toJson()));*/

    return user; 





  } 

  void logout()async{ 
    print('Auth provider:logout');
    _token=null;
    _expiryDate=null;
    _user=null;
    if(_authTimer!=null)
      _authTimer.cancel();  
      _authTimer=null;

    notifyListeners(); 
    /*var pref =  await SharedPreferences.getInstance(); 
        pref.remove('userData');*/

  }  

  void autoLogout(){ 
    print('inside auto:logout');
   
    if(_authTimer!=null)
      _authTimer.cancel();  
      _authTimer=null;

    var timeLeftInSec = _expiryDate.difference(DateTime.now()).inSeconds; 
    _authTimer=Timer(Duration(seconds: 3),()=>logout());


    /*var pref =  await SharedPreferences.getInstance(); 
        pref.remove('userData');*/

  }  

  Future<bool>tryAutoLogin()async{ 
    print('inside auto login');
     /*var pref =  await SharedPreferences.getInstance(); 
        pref.remove('userData');
      if(!pref.containsKey('userData')){ 

        print('does not contains key in pref'); 
        return false; 
      }
      var user=User.fromJson(json.decode(pref.getString('userData')));
      if(user.expiresAt.isAfter(DateTime.now())
         print('Token is expired');
          return false; 

      _token=user.accessToken;
      _expiryDate=user.expiresAt; 
      _user=user; */
      autoLogout(); 
      return true; 
  }








} 