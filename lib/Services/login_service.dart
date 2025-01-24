import 'package:dio/dio.dart';
import 'package:work_task/Models/register_model.dart';

class LoginService {
  static Dio dio = Dio();
  static loginData(String email,String password,)async{
    var response = await dio.post("https://student.valuxapps.com/api/login",
        data:{
          "email":email,
          "password":password
        }
    );
    if(response.statusCode! >= 200 && response.statusCode! < 300)
    {
      print(response.data);
      return RegisterModel.fromJson(response.data);
    }
    else
    {
      throw Exception("Server Error ");
    }
  }
}






