import 'package:flutter/cupertino.dart';
import '../Models/products_model.dart';
import '../Services/products_service.dart';

class ProductsProvider extends ChangeNotifier {
  ProductModel? productModel;

  Future<void> fetchData() async {
    productModel = await ProductsService.getData();
    notifyListeners();
  }
}