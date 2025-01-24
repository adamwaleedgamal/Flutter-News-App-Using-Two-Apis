import 'package:dio/dio.dart';
import '../Models/category_model.dart';

class CategoryService {
  static Dio dio = Dio();

  static Future<CategoryModel> getCategories() async {
    var response = await dio.get("https://student.valuxapps.com/api/categories");
    print(response.data);
    return CategoryModel.fromJson(response.data);
  }
}