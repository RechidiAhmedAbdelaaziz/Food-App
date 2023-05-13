import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences? sharedPerfrences  ;
  static init() async {
      sharedPerfrences = await SharedPreferences.getInstance();
  }

  static Future<bool?> saveData({
    required String key,
    required value,
  }) async {
    if (value is int ){return await sharedPerfrences?.setInt(key, value);}
    if (value is bool ){return await sharedPerfrences?.setBool(key, value);}
    if (value is String ){return await sharedPerfrences?.setString(key, value);}
    return null;
    
  }

  
  static dynamic getData({required String key}) {
    return  sharedPerfrences?.get(key);
  }

  

  static Future<bool?> clearData({required String key})async {
    return await sharedPerfrences?.remove(key);
  }
}


