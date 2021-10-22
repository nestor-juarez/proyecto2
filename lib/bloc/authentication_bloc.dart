import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:sistema_experto_pg2/model/session_model.dart';
import 'package:sistema_experto_pg2/repository/session_repository.dart';

part 'authentication_event.dart';

part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final SessionRepository _sessionRepository;

  AuthenticationBloc({required SessionRepository sessionRepository})
      : _sessionRepository = sessionRepository,
        super(AuthenticationUninitialized());

  @override
  Stream<AuthenticationState> mapEventToState(AuthenticationEvent event) async* {
    if (event is AppStarted) {
      final bool hasSession = await _sessionRepository.hasSession();

      if (hasSession) {
        yield AuthenticationAuthenticated();
      } else {
        yield AuthenticationUnauthenticated();
      }
    }

    if (event is LoggedIn) {
      yield AuthenticationLoading();

      await _sessionRepository.persistSession(session: event.session);
      yield AuthenticationAuthenticated();
    }

    if (event is LoggedOut) {
      yield AuthenticationLoading();
      await _sessionRepository.logoutSession();
      yield AuthenticationUnauthenticated();
    }
  }
}
