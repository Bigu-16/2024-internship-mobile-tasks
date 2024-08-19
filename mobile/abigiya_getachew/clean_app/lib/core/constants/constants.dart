class Urls {
  static const String baseUrl =
      'https://g5-flutter-learning-path-be.onrender.com/api/v1/products';
  static const String userLoginBaseUrl =
      'https://g5-flutter-learning-path-be.onrender.com/api/v2/auth/login';
  static const String userSignupBaseUrl =
      'https://g5-flutter-learning-path-be.onrender.com/api/v2/auth/register';

  static String getProductById(String id) => '$baseUrl/$id';
}
