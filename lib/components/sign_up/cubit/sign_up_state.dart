part of 'sign_up_cubit.dart';

class SignUpState extends Equatable {
  const SignUpState({
    this.name = const Name.pure(),
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.status = FormzStatus.pure,
  });

  final Name name;
  final Email email;
  final Password password;
  final FormzStatus status;

  @override
  List<Object> get props => [name, email, password, status];

  SignUpState copyWith({
    Name name,
    Email email,
    Password password,
    FormzStatus status,
  }) {
    return SignUpState(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
    );
  }
}