part of 'login_bloc.dart';

 abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}
class EmailInput extends LoginEvent {
   String email;
   EmailInput({required this.email});
   @override
   List<Object> get props => [email];
}

class PasswordInput extends LoginEvent {
   String password;
   PasswordInput({required this.password});
  @override
  List<Object> get props => [password];
}

class LoginApi extends LoginEvent {}