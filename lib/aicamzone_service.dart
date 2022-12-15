import 'package:aicamzone/aicamzone.dart';
import 'package:aicamzone/user.dart';
import 'package:dio/dio.dart';

class AicamzoneService{
  static Future<List<Aicamzone>> getDataAicamzone() async {
    Response response = await Dio().get("http://192.168.100.199:3000/data");
    List<Aicamzone> aicamzone = (response.data as List).map((v) => Aicamzone.fromJson(v)).toList();
    return aicamzone;
  }

  static Future<List<Aicamzone>> getDataAicamzoneBookmark() async {
    Response response = await Dio().get("http://192.168.100.199:3000/data?isBookmark=true");
    List<Aicamzone> aicamzone = (response.data as List).map((v) => Aicamzone.fromJson(v)).toList();
    return aicamzone;
  }

  static Future<List<User>> getDataUserId(String id) async {
    Response response = await Dio().get("http://192.168.100.199:3000/users?id=" + id);
    List<User> users = (response.data as List).map((v) => User.fromJson(v)).toList();
    return users;
  }

    static void removeProfile(String id) async{
    try{
      var response = await Dio().delete(
          "http://192.168.100.199:3000/users/" + id);
      if (response.statusCode == 200) {
        print("Profile removed successfully");
      } else {
        print("Failed");
      }
    }
    catch(e){
      print(e);
    }
  }

}