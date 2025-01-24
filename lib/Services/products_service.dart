import 'package:dio/dio.dart';
import '../Models/products_model.dart';

class ProductsService {
  static Dio dio = Dio();

  static Future<ProductModel> getData() async {
    var response = await dio.get("https://student.valuxapps.com/api/home");
    print(response.data);
    return ProductModel.fromJson(response.data);
  }
}