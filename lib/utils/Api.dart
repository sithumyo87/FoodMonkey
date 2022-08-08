import 'dart:convert';

class Api{
  static Future<bool> getAllCat() async{
    await Future.delayed(Duration(seconds: 3));
    return true;
  }

  static Future<bool> getAllSubs() async{
    await Future.delayed(Duration(seconds: 2));
    return true;
  }

  static Future<bool> getAllTags() async{
    await Future.delayed(Duration(seconds: 2));
    return true;
  }

  static Future<bool> getAllRegisters(username,email,phone,password) async{
    var userRegister = {"name":username,"email":email,"phone":phone,"password":password};
    var userRegisterEncode = jsonEncode(userRegister);
    print(userRegisterEncode);
    return true;
  }

 static Future<bool> getAllLogin(phone,password) async{
  var loginUser = {"phone":phone,"password":password};
  var encodeData =  jsonEncode(loginUser);
  print(encodeData);
  return true;
 }
}