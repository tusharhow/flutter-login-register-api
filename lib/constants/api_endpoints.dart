class ApiEndPoints {
  static const String baseUrl = 'http://restapi.adequateshop.com/api/';
  static var authEndpoints = _AuthEndPoints();
  static var userList = _UserList();
}

class _AuthEndPoints {
  final String registerEmail = 'authaccount/registration';
  final String loginEmail = 'authaccount/login';
}

class _UserList {
  final String userList = 'users?page=1';
}
