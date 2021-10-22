enum HttpType { get, post, put, delete }

enum HttpStatus {
  success,
  error,
}

enum HttpCode {
  success,
  created,
  not_content,
  bad_request,
  authorized,
  forbidden,
  not_found,
  method_not_allowed,
  server_error
}

class ValidHttp {
  ValidHttp._privateConstructor();

  static final ValidHttp shared = ValidHttp._privateConstructor();

  HttpCode code(int httpCode) {
    switch (httpCode) {
      case 200:
        return HttpCode.success;
        break;
      case 201:
        return HttpCode.created;
        break;
      case 204:
        return HttpCode.not_content;
        break;
      case 400:
        return HttpCode.bad_request;
        break;
      case 401:
        return HttpCode.authorized;
        break;
      case 403:
        return HttpCode.forbidden;
        break;
      case 404:
        return HttpCode.not_found;
        break;
      case 405:
        return HttpCode.method_not_allowed;
        break;
      default:
        return HttpCode.server_error;
    }
  }
}
