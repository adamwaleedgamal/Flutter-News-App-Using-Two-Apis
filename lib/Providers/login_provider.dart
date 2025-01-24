import 'package:flutter/cupertino.dart';
import 'package:work_task/Models/register_model.dart';
import '../Services/login_service.dart';

class LoginProvider extends ChangeNotifier{
  RegisterModel? loginModel;
  Future<bool> login(String email,String password)async{
    try
    {
      await LoginService.loginData(email, password);
      notifyListeners();
      return true ;
    }
    catch(e)
    {
      print(e.toString());
    }
    return false;
  }
}