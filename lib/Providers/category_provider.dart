import 'package:flutter/cupertino.dart';
import '../Models/category_model.dart';
import '../Services/category_service.dart';

class CategoryProvider extends ChangeNotifier {
  CategoryModel? categoryModel;

  Future<void> fetchCategories() async {
    categoryModel = await CategoryService.getCategories();
    notifyListeners();
  }
}