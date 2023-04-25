class CustomError {
  late String error;
  late String message;

  CustomError({required this.error, required this.message});

  CustomError.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    message = json['message'];
  }
}
