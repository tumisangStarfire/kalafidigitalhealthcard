
enum Gender{ 
   male,
  female,
  other
}

class UserProfile{  
  String  storageId;
  String  userId;
  DateTime dob; 
  Gender gender; 
  int omang; 
  String profilePicture; 
  double weight; 
  double height; 
  double bmi;
  String bloodType; 
  int waistSize;  

  String get getStorageId =>storageId; 

  set setStorageId(String storageId){ 
    this.storageId=storageId;
  }

  
  String get getUserId=>userId; 

  set setUserId(String userId){ 
    this.userId = userId; 

  }

  DateTime get getDateofBirth => dob; 

  set setDateofBirth(DateTime dob){ 
    this.dob = dob;
  } 

  Gender get getGender => gender; 

  set setGender(Gender gender){ 
    this.gender =gender;

  }  

  int get getOmang => omang; 

  set setOmang(int omang){
    this.omang =omang;
  } 

  String get getProfilePicture => profilePicture; 

  set setProfilePicture(String profilePicture){ 
    this.profilePicture =profilePicture;
  } 

  double get getWeight => weight; 

  set setWeight(double weight){ 
    this.weight =weight;
  } 

  double get getHeight => height; 

  set setHeight(double height){ 
    this.height= height;
  }    

 String get getBloodType => bloodType;  

 set setBloodType(String bloodType){ 
   this.bloodType = bloodType;
 }  

 int get getWaistSize =>waistSize;

 set setWaistSize(int waistSize){ 
   this.waistSize = waistSize;
 }


  //calculate Body mass index 
   calculateBMI(double weight,double  height) {
    return this.bmi = weight / (height * height);
  }  

  //calculate age 

  calculateAge(DateTime dateofbirth){ 
    DateTime todaysDate = DateTime.now(); 
    int age = todaysDate.year - dateofbirth.year; 
    return age;
  }

  UserProfile({
    this.storageId,
    this.userId,
    this.dob,
    this.gender,
    this.omang,
    this.profilePicture,
    this.weight,
    this.height,
    this.bmi,
    this.bloodType,
    this.waistSize

  });

   ///check for the user variables, also check if they are empty
  factory UserProfile.fromJson(Map<String, dynamic>json){
    return UserProfile( 
      	storageId : json['_id'], 
        	userId : json['userId'],  
        dob:  json['dob']  != null ? json['dob'] : null , 
        gender: json['gender'] != null ? json['gender'] :null, 
        omang:  json['omang'] != null ? json['omang'] :null,  
        profilePicture:  json['profilePicture'] != null ? json['profilePicture'] :null, 
        weight :  json['weight'] != null ? json['weight'] :null, 
        height:  json['height'] != null ? json['height'] :null,
        bmi:  json['bmi'] != null ? json['bmi'] :null,
        bloodType:  json['bloodType'] != null ? json['bloodType'] :null,
        waistSize:  json['waistSize'] != null ? json['waistSize'] :null,
      
    );
   }

    Map<String, dynamic> toJson() {
      final Map<String, dynamic> data = new Map<String, dynamic>(); 
       data['storageId'] = this.storageId; 
      data['userId'] = this.userId; 
      data['dob'] = this.dob; 
      data['gender'] = this.gender; 
      data['omang'] = this.omang; 
      data['profilePicture'] = this.profilePicture; 
      data['weight'] = this.weight;
      data['height']=this.height;
      data['bmi']=this.bmi;
      data['bloodType']=this.bloodType;
      data['waistSize']=this.waistSize;
      return  data;
   }

}