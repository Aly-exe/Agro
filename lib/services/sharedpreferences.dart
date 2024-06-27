import 'package:shared_preferences/shared_preferences.dart';

class CashHelper {
  static SharedPreferences? cash;
  static init()async{
    cash = await SharedPreferences.getInstance();
  }
  static Future<dynamic> setData(
      {required String key, required dynamic value}) async { 

    if (value is int) return cash?.setInt(key, value);
    if (value is String) return cash?.setString(key, value);
    return cash?.setInt(key, value);
  }

  static dynamic getData({required String key})  {
    
    return cash?.get(key);
  }
  static Future DeleteData({required String key}) async {
    return await cash?.remove(key);
  }
  
}
