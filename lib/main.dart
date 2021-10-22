import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sistema_experto_pg2/bloc/authentication_bloc.dart';
import 'package:sistema_experto_pg2/pages/login_page.dart';
import 'package:sistema_experto_pg2/repository/session_repository.dart';

void main() {
  final SessionRepository sessionRepository = SessionRepository();
  runApp(BlocProvider<AuthenticationBloc>(
    create: (context) {
      return AuthenticationBloc(sessionRepository: sessionRepository)
        ..add(AppStarted());
    },
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          return const LoginPage();
        },
      ),
    );
  }
}