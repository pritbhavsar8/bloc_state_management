import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super( LoginState()) {
    on<EmailInput>(onEmailChanged);
    on<PasswordInput>(onPasswordChanged);
    on<LoginApi>(loginApi);
  }

  void onEmailChanged(EmailInput event, Emitter<LoginState> emit) {
    emit(
      state.copyWith(
        email: event.email,
      ),
    );
  }

  void onPasswordChanged(PasswordInput event, Emitter<LoginState> emit) {
    emit(
      state.copyWith(
        password: event.password,
      ),
    );
  }

  void loginApi(LoginApi event, Emitter<LoginState> emit) async {
    emit(
      state.copyWith(
        loginStatus: LoginStatus.loading,
      ),
    );
    Map para = {
      'email': state.email,
      'password': state.password
    };

    try {
      final response = await http.post(Uri.parse('https://reqres.in/api/login'), body: para);
      var json = jsonDecode(response.body);
      if (response.statusCode == 200) {
        emit(
          state.copyWith(
            loginStatus: LoginStatus.success,
            message: 'Login successful',
          ),
        );
      } else {
        emit(
          state.copyWith(
            loginStatus: LoginStatus.error,
            message: json['error'],
          ),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(
          loginStatus: LoginStatus.error,
          message: e.toString(),
        ),
      );
    }
  }
}
