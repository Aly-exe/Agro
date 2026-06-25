import 'package:shared_preferences/shared_preferences.dart';

class CsahHelper {
    static SharedPreferences? cashHelper;
    final String nameKey = "name";
  Future init()async{
    cashHelper =await SharedPreferences.getInstance();
  }
  
  Future insert(data)async{
    if(data is String){
      await cashHelper!.setString(nameKey, data);
    }else if(data is double){
      await cashHelper!.setDouble(nameKey, data);
    }else if(data is int){
      await cashHelper!.setInt(nameKey, data);
    }else if(data is bool){
      await cashHelper!.setBool(nameKey, data);
    }
  }

  Future<String> getName()async{
    return await cashHelper!.get(nameKey).toString();
  }
  Future delete()async{
    await cashHelper!.remove(nameKey);
  }
}