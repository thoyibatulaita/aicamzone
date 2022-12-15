import 'package:aicamzone/aicamzone.dart';
import 'package:dio/dio.dart';

class AicamzoneService{
  static Future<List<Aicamzone>> getDataAicamzone() async {
    Response response = await Dio().get("http://192.168.31.181:3000/data");
    List<Aicamzone> aicamzone = (response.data as List).map((v) => Aicamzone.fromJson(v)).toList();
    return aicamzone;
  }

  static Future<List<Aicamzone>> getDataAicamzoneBookmark() async {
    Response response = await Dio().get("http://192.168.31.181:3000/data?isBookmark=true");
    List<Aicamzone> aicamzone = (response.data as List).map((v) => Aicamzone.fromJson(v)).toList();
    return aicamzone;
  }
}