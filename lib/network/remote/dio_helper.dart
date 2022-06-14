
import 'package:dio/dio.dart';

class DioHelper {
  
static var dio = Dio();

  static init(){
    dio=Dio(BaseOptions(receiveDataWhenStatusError: true,baseUrl: 'http://api.alquran.cloud/'));
  }

 static Future<Response> getData({required String? url , Map<String, dynamic>? query} )async{
   return await dio.get(url.toString(),queryParameters:query );
 }




}