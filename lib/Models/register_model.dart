class RegisterModel{
  Map<String, dynamic> data;
  bool status;
  String message;
  RegisterModel({required this.data, required this.message, required this.status});

  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(
        data: json['data'], message: json['message'], status: json['status']);
  }
}