import 'package:dio/dio.dart';
import 'package:peticiones_dio_app/peticiones/answer_model.dart';


class GetDataUsers{
  final _dio = Dio();

  Future <dynamic> getAnsWerData()async{
    //final response = await _dio.get('https://randomuser.me/api/');
    final response = await _dio.get('https://reqres.in/api/users');
    //print(response);
    final data = responseDataFromJson(response.toString());
    return data.data;
  }

}