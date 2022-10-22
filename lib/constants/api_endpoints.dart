class ApiEndPoints {
  static const String baseUrl = 'http://restapi.adequateshop.com/api/';
  static var authEndpoints = _AuthEndPoints();
}

class _AuthEndPoints {
  final String registerEmail = 'authaccount/registration';
  final String loginEmail = 'authaccount/login';
}
