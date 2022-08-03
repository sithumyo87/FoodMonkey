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
}