import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sistema_experto_pg2/bloc/authentication_bloc.dart';
import 'package:sistema_experto_pg2/bloc/login_bloc.dart';
import 'package:sistema_experto_pg2/repository/session_repository.dart';
import 'package:sistema_experto_pg2/util/constants.dart';
import 'package:sistema_experto_pg2/widget/dialogs.dart';

import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _keyLoader = GlobalKey<State>();
  final SessionRepository _sessionRepository = SessionRepository();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwdController = TextEditingController();

  Widget _buildEmailTF() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Correo Electrónico',
          style: kLabelStyle,
        ),
        const SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            style: const TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            controller: _emailController,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: const EdgeInsets.only(top: 14.0),
              prefixIcon: const Icon(Icons.email, color: Colors.white),
              hintText: 'Escribir Correo Electrónico',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordTF() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Contraseña',
          style: kLabelStyle,
        ),
        const SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            obscureText: true,
            controller: _pwdController,
            style: const TextStyle(color: Colors.white, fontFamily: 'OpenSans'),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: const EdgeInsets.only(top: 14.0),
              prefixIcon: const Icon(Icons.lock, color: Colors.white),
              hintText: 'Escribir Contraseña',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildForgotPasswordBtn() {
    return Container(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () => print('Forgot Password Button Pressed'),
        child: Text('Olvido su Contraseña?', style: kLabelStyle),
      ),
    );
  }

  Widget _buildLoginBtn(BuildContext mcontext) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 5.0,
          padding: const EdgeInsets.all(15.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          primary: Colors.white,
        ),
        onPressed: () {
          Dialogs.showLoadingDialog(context, _keyLoader, "Iniciando sesión");
          BlocProvider.of<LoginBloc>(mcontext).add(
            LoginButtonPressed(
                email: _emailController.text, password: _pwdController.text),
          );
        },
        child: const Text(
          'INGRESO',
          style: TextStyle(
            color: Color(0xFF03045E),
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  Widget _buildSignupBtn() {
    return GestureDetector(
      onTap: () => print('Sign Up Button Pressed'),
      child: RichText(
        text: const TextSpan(children: []),
      ),
    );
  }

  Widget _getBody(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Stack(
          children: <Widget>[
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF03045E),
                    Color(0xFF0077B6),
                    Color(0xFF00B4D8),
                    Color(0xFF90E0EF),
                  ],
                  stops: [0.1, 0.4, 0.7, 0.9],
                ),
              ),
            ),
            SizedBox(
              height: double.infinity,
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(
                  horizontal: 40.0,
                  vertical: 225.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'INGRESO A SISTEMA',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'OpenSans',
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 30.0),
                    _buildEmailTF(),
                    const SizedBox(height: 30.0),
                    _buildPasswordTF(),
                    _buildForgotPasswordBtn(),
                    _buildLoginBtn(context),
                    _buildSignupBtn(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocProvider(
          create: (context) {
            return LoginBloc(
              userRepository: _sessionRepository,
              authenticationBloc: BlocProvider.of<AuthenticationBloc>(context),
            );
          },
          child: BlocListener<LoginBloc, LoginState>(
            listener: (context, state) {
              //Navigator.of(_keyLoader.currentContext!, rootNavigator: true).pop();

              if (state is LoginFaliure) {}

              if (state is LoginSuccess) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const MyHomePage()),
                );
              }
            },
            child: BlocBuilder<LoginBloc, LoginState>(
              builder: (context, state) {
                return _getBody(context);
              },
            ),
          ),
        ),
      ),
    );
  }
}
