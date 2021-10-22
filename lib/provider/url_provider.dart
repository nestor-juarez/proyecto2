class PathUri {
  PathUri._privateConstructor();

  static final PathUri shared = PathUri._privateConstructor();

  String login = "${BaseUri.shared.complementLogin}/login";
  String signup = "${BaseUri.shared.complementLogin}/signup";
}

class BaseUri {
  BaseUri._privateConstructor();

  static final BaseUri shared = BaseUri._privateConstructor();

  String apiUrl = '34.125.206.43:8080';

  String complementLogin = "/api/users";
}