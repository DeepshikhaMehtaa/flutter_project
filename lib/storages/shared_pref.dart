import 'package:loginentry/storages/contsants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedManger{
  SharedManger._();
  static SharedPreferences _preferences;

  static void saveFirstLogin(bool isFirst)async{
    _preferences = await SharedPreferences.getInstance();
    _preferences.setBool(Constants.LOGIN_KEY, isFirst);
  }

  static Future<bool> getFirstLogin()async{
    _preferences = await SharedPreferences.getInstance();
    return _preferences.getBool(Constants.LOGIN_KEY);
  }

}