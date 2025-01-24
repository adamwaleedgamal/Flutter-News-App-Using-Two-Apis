import 'package:flutter/material.dart';

import '../Models/register_model.dart';
import '../Services/resgister_service.dart';

class RegisterProvider extends ChangeNotifier{
  RegisterModel? registerModel;
  Future<bool> Register(String email,String password,String name,String phone)async{
    try
    {
      await RegisterService.registerData(email, password,name,phone);
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