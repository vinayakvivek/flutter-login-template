import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login_template/components/sign_up/sign_up.dart';
import 'package:formz/formz.dart';

class SignUpForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state.status.isSubmissionFailure) {
          Scaffold.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(content: Text('Authentication Failure')),
            );
        }
      },
      child: Align(
        alignment: const Alignment(0, -0.5),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/auth_logo.png',
              height: 120,
            ),
            const SizedBox(height: 16.0),
            _NameInput(),
            const SizedBox(height: 8.0),
            _EmailInput(),
            const SizedBox(height: 8.0),
            _PasswordInput(),
            const SizedBox(height: 8.0),
            _SignUpButton(),
          ],
        ),
      ),
    );
  }
}

class _NameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (previous, current) => previous.name != current.name,
      builder: (context, state) {
        final bloc = context.bloc<SignUpCubit>();
        return TextField(
          key: const Key('signUpForm_nameInput_textField'),
          onChanged: (name) => bloc.nameChanged(name),
          decoration: InputDecoration(
            labelText: 'name',
            helperText: '',
            errorText: state.name.invalid
                ? 'Name should be atleast 5 letters'
                : null,
          ),
        );
      },
    );
  }
}

class _EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        final bloc = context.bloc<SignUpCubit>();
        return TextField(
          key: const Key('signUpForm_emailInput_textField'),
          onChanged: (email) => bloc.emailChanged(email),
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: 'email',
            helperText: '',
            errorText: state.email.invalid ? 'invalid email' : null,
          ),
        );
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        final bloc = context.bloc<SignUpCubit>();
        return TextField(
          key: const Key('signUpForm_passwordInput_textField'),
          onChanged: (password) => bloc.passwordChanged(password),
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'password',
            helperText: '',
            errorText: state.password.invalid ? 'invalid password' : null,
          ),
        );
      },
    );
  }
}

class _SignUpButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        final bloc = context.bloc<SignUpCubit>();
        return state.status.isSubmissionInProgress
            ? const CircularProgressIndicator()
            : RaisedButton(
                key: const Key('signUpForm_continue_raisedButton'),
                child: const Text('SIGN UP'),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                color: const Color(0xFFFFD600),
                onPressed: state.status.isValidated
                    ? () => bloc.signUp()
                    : null
            );
      },
    );
  }
}
