import 'package:dio/dio.dart';

import '../Models/register_model.dart';

class RegisterService{
  static Dio dio = Dio();
  static registerData(String email,String password,String name,String phone)async{
    var response = await dio.post("https://student.valuxapps.com/api/register",
        data:{
          "email":email,
          "password":password,
          "phone":phone,
          "name":name
        }
    );
    if(response.statusCode! >= 200 && response.statusCode! < 300)
    {
      print(response.data);
      return RegisterModel.fromJson (response.data);
    }
    else
    {
      throw Exception("Server Error ");
    }
  }
}

