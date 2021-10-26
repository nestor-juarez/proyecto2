class PathUri {
  PathUri._privateConstructor();

  static final PathUri shared = PathUri._privateConstructor();

  String login = "${BaseUri.shared.complementLogin}/login";
  String signup = "${BaseUri.shared.complementLogin}/signup";
  String getAllProducts = "${BaseUri.shared.complementProducts}/all";
}

class BaseUri {
  BaseUri._privateConstructor();

  static final BaseUri shared = BaseUri._privateConstructor();

  String apiUrl = '34.125.199.201:8080';

  String complementLogin = "/api/users";
  String complementProducts = "/api/product";
}