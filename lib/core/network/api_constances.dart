
class ApiConstances {
  static const String _baseUrl = "https://reqres.in/api";

  // Users
  static const String getUsersListUrl = "$_baseUrl/users";
  static String updateUserUrl(int id) => "$_baseUrl/users/$id";

}
