import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login_template/components/sign_up/sign_up.dart';

class SignUpPage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute(builder: (_) => SignUpPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SignUp')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocProvider(
          create: (_) => SignUpCubit(
            context.repository<AuthenticationRepository>(),
          ),
          child: SingleChildScrollView(
            child: SignUpForm(),
          ),
        ),
      ),
    );
  }
}
