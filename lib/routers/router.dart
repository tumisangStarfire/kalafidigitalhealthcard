import 'package:flutter/material.dart';
import 'package:kalafidigitalhealthcard/routers/routerconstants.dart';
import 'package:kalafidigitalhealthcard/screens/auth/createpassword.dart';
import 'package:kalafidigitalhealthcard/screens/auth/login.dart';
import 'package:kalafidigitalhealthcard/screens/auth/register.dart';
import 'package:kalafidigitalhealthcard/screens/currentmedication/createcurrentmedicationscreen.dart';
import 'package:kalafidigitalhealthcard/screens/currentmedication/listcurrentmedicationscreen.dart';
import 'package:kalafidigitalhealthcard/screens/dashboardscreen.dart';
import 'package:kalafidigitalhealthcard/screens/emergencyservices.dart';
import 'package:kalafidigitalhealthcard/screens/findhealthcenterscreen.dart';
import 'package:kalafidigitalhealthcard/screens/illness/createillnessscreen.dart';
import 'package:kalafidigitalhealthcard/screens/illness/listillnessscreen.dart';
import 'package:kalafidigitalhealthcard/screens/injury/createinjuryscreen.dart';
import 'package:kalafidigitalhealthcard/screens/injury/listinjuryscreen.dart';
import 'package:kalafidigitalhealthcard/screens/medicalcondition/createmedicalcondition.dart';
import 'package:kalafidigitalhealthcard/screens/medicalcondition/medicalconditionsscreen.dart';
import 'package:kalafidigitalhealthcard/screens/medicalfies/createmedicalfile.dart';
import 'package:kalafidigitalhealthcard/screens/medicalfies/usersmedicalfiles.dart';
import 'package:kalafidigitalhealthcard/screens/settings.dart';
import 'package:kalafidigitalhealthcard/screens/undefined_view.dart';
import 'package:kalafidigitalhealthcard/screens/userpofilescreen.dart';
import 'package:kalafidigitalhealthcard/screens/vaccince/createvaccinescreen.dart';
import 'package:kalafidigitalhealthcard/screens/vaccince/listvaccinescreen.dart';
import 'package:kalafidigitalhealthcard/screens/verifyotpscreen.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings){

  switch(routeSettings.name){
    case LoginScreenRoute:
        return MaterialPageRoute(builder: (context) =>LoginScreen());
    case RegisterScreenRoute:
       return MaterialPageRoute(builder: (context) =>RegisterScreen());
    case VerifyOTPRoute:
        return MaterialPageRoute(builder: (context) =>VerifyOTPScreen());
    case CreatePasswordRoute:
         return MaterialPageRoute(builder: (context) =>CreatePasswordScreen());
    case DashBoardRoute:
        return MaterialPageRoute(builder: (context)=> DashBoardScreen());
    case UserProfileRoute :
        return MaterialPageRoute(builder: (context)=> UserProfileScreen());
    case SettingsRoute :
        return MaterialPageRoute(builder: (context)=> SettingsScreen());
    case ListUserInjuriesRoute :
        return MaterialPageRoute(builder: (context)=> ListlInjuryScreen());
    case CreateUserInjuryRoute :
        return MaterialPageRoute(builder: (context)=> CreateInjuryScreen());
    case ListUserIllnessRoute:
        return MaterialPageRoute(builder: (context)=> ListIllnessScreen());
    case CreateUserIllnessRoute:
        return MaterialPageRoute(builder: (context)=> CreateIllnessScreen());
    case ListUserVaccinesRoute:
        return MaterialPageRoute(builder: (context)=> ListVaccineScreen());
    case CreateUserVaccineRoute:
        return MaterialPageRoute(builder: (context)=> CreateVaccineScreen());
    case MedicalConditionsRoute:
        return MaterialPageRoute(builder: (context)=> MedicalConditionsScreen());
    case CreateMedicalConditionRoute:
        return MaterialPageRoute(builder: (context)=> CreateMedicalConditionScreen());
    case CreateCurrentMedicationRoute:
        return MaterialPageRoute(builder: (context)=> CreateCurrentMedicationScreen());
    case ListCurrentMedicationRoute:
        return MaterialPageRoute(builder: (context)=> ListCurrentMedicationScreen());
    case CreateMedicalFilesRoute:
         return MaterialPageRoute(builder: (context)=> CreateMedicalFileScreen());
    case UsersMedicalFilesRoute:
        return MaterialPageRoute(builder: (context)=> UsersMedicalFiles());
    case FindHealthCenterRoute:
         return MaterialPageRoute(builder: (context)=> FindHealthCenterScreen());
    case EmergencyServicesRoute:
         return MaterialPageRoute(builder: (context)=> EmergencyServicesScreen());
    default:
        return MaterialPageRoute(builder: (context)=> UndefinedView());
  }

}