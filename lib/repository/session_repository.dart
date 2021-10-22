import 'package:sistema_experto_pg2/model/response_model.dart';
import 'package:sistema_experto_pg2/model/session_model.dart';
import 'package:sistema_experto_pg2/provider/api_manager.dart';
import 'package:sistema_experto_pg2/provider/login_provider.dart';
import 'package:sistema_experto_pg2/provider/url_provider.dart';
import 'package:sistema_experto_pg2/util/app_type.dart';

class SessionRepository {
  Future<ResponseData> authenticate({
    required String email,
    required String password,
  }) async {
    LoginSerialize serialize = LoginSerialize(email: email, password: password);

    final result = await ApiManager.shared.request(
      baseUrl: BaseUri.shared.apiUrl,
      uri: PathUri.shared.login,
      type: HttpType.post,
      bodyParams: serialize.toJson(),
    );

    return result;
  }

  Future<bool> hasSession() async {
    return await LoginProvider.shared.existSession();
  }

  Future<void> persistSession({required Session session}) async {
    await LoginProvider.shared.save(session);
  }

  Future<void> logoutSession() async {
    await LoginProvider.shared.deleteSession();
  }

  Future<Session> me() async {
    return await LoginProvider.shared.me();
  }
}

class LoginSerialize {
  String email;
  String password;

  LoginSerialize({required this.email, required this.password});

  Map<String, String> toJson() => {
        "user": email,
        "password": password,
      };
}
