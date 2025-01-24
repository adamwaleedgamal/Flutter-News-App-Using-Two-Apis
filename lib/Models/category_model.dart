class CategoryModel {
  final List<dynamic> data;

  CategoryModel({required this.data});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(data: json['data']['data']);
  }
}