part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AppStarted extends AuthenticationEvent {}

class LoggedIn extends AuthenticationEvent {
  final Session session;

  const LoggedIn({required this.session});

  @override
  List<Object> get props => [session];

  @override
  String toString() => 'LoggedIn { user: $session.fullName.toString() }';
}

class LoggedOut extends AuthenticationEvent {}