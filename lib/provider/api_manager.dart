import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:sistema_experto_pg2/model/response_model.dart';

import '../util/app_type.dart';
import 'login_provider.dart';

class ApiManager {
  ApiManager._privateConstructor();

  static final ApiManager shared = ApiManager._privateConstructor();

  Future<ResponseData> request({
    required String baseUrl,
    required String uri,
    required HttpType type,
    Map<String, dynamic>? bodyParams,
    Map<String, String>? uriParams,
  }) async {
    Response response;
    Uri url = Uri.http(baseUrl, uri);
    Map<String, String> headers = {'Content-Type': 'application/json'};
    final hasSession = await LoginProvider.shared.existSession();

    if (hasSession) {
      url = (uriParams != null) ? Uri.http(baseUrl, uri, uriParams) : url;

      final userToken = await LoginProvider.shared.getToken();
      headers = {
        'Content-Type': 'application/json',
        "Authorization": "Bearer $userToken"
      };
    }

    switch (type) {
      case HttpType.get:
        response = await http.get(url, headers: headers);
        break;
      case HttpType.post:
        response = await http.post(
          url,
          headers: headers,
          body: jsonEncode(bodyParams),
          encoding: Encoding.getByName('utf-8'),
        );
        break;
      case HttpType.put:
        response =
            await http.put(url, headers: headers, body: jsonEncode(bodyParams));
        break;
      default:
        response = await http.delete(url, headers: headers);
    }

    return _valid(response);
  }

  ResponseData _valid(Response response) {
    HttpCode httpCode = ValidHttp.shared.code(response.statusCode);
    ResponseData result = ResponseData();
    result.code = httpCode;

    if (httpCode != HttpCode.server_error) {
      var msg;
      var recordset;
      Map<String, dynamic> jsonData;

      try {
        jsonData = json.decode(response.body);
        if (jsonData.keys.contains("recordset")) {
          msg = jsonData["msg"];
          recordset = jsonData["recordset"];
        } else {
          if (jsonData.keys.contains("id")) {
            recordset = jsonData;
          } else {
            if (httpCode == HttpCode.success) {
              int page = jsonData["page"]["totalPages"];
              recordset = jsonData["content"];

              if (page <= 0) {
                httpCode = HttpCode.not_content;
              }
            }
          }
        }
      } on FormatException catch (e) {
        print("error: ${e.message}");
      }

      if (httpCode == HttpCode.success || httpCode == HttpCode.created) {
        result.msg = "success";
        result.recordset = recordset;
        result.status = HttpStatus.success;
      } else if (httpCode == HttpCode.not_content) {
        result.msg = msg ?? "error_not_content";
        result.status = HttpStatus.error;
      } else if (httpCode == HttpCode.bad_request) {
        result.msg = msg ?? "error_bad_request";
        result.status = HttpStatus.error;
      } else if (httpCode == HttpCode.authorized) {
        result.msg = msg ?? "error_authorized";
        result.status = HttpStatus.error;

        /*if (context != null) {
          final authBloc = BlocProvider.of<AuthenticationBloc>(context);
          authBloc.add(LoggedOut());
        }*/
      } else if (httpCode == HttpCode.forbidden) {
        result.msg = msg != null
            ? msg == "Forbidden"
                ? "error_forbidden"
                : msg
            : "error_forbidden";
        result.status = HttpStatus.error;
      } else if (httpCode == HttpCode.not_found) {
        result.msg = msg ?? "error_not_found";
        result.status = HttpStatus.error;
      } else if (httpCode == HttpCode.method_not_allowed) {
        result.msg = msg ?? "error_not_allowed";
        result.status = HttpStatus.error;
      } else {
        result.msg = "error_critical";
        result.status = HttpStatus.error;
      }
    } else {
      result.status = HttpStatus.error;
      result.msg = "error_server";
    }

    return result;
  }
}

class ApiResponse {
  dynamic data;
  HttpStatus? status;

  ApiResponse({this.data, this.status});
}
