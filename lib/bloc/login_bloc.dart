import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sistema_experto_pg2/model/session_model.dart';
import 'package:sistema_experto_pg2/repository/session_repository.dart';
import 'package:sistema_experto_pg2/util/app_type.dart';

import 'authentication_bloc.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final SessionRepository userRepository;
  final AuthenticationBloc authenticationBloc;

  LoginBloc({
    required this.userRepository,
    required this.authenticationBloc,
  }) : super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginButtonPressed) {
      yield LoginInitial();

      try {
        final response =
            await userRepository.authenticate(email: event.email, password: event.password);

        if (response.status == HttpStatus.success) {
          UserSession userSession = UserSession.fromJsonList(response.recordset);
          authenticationBloc.add(LoggedIn(session: userSession.session!));
          yield LoginSuccess();
        } else {
          yield LoginFaliure(error: response.msg!);
        }
      } catch (error) {
        yield LoginFaliure(error: error.toString());
      }
    }
  }
}
