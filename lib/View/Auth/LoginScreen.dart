import 'package:bloc_state_management/Routes/routes_name.dart';
import 'package:bloc_state_management/bloc/Login_Api/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late LoginBloc _loginBlocs;
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loginBlocs = LoginBloc();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _loginBlocs.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (_) => _loginBlocs,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BlocBuilder<LoginBloc, LoginState>(
                      buildWhen: (current, previous) => current.email != previous.email,
                      builder: (context, state) {
                        return SizedBox(
                          width: 300.0,
                          child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            focusNode: emailFocusNode,
                            decoration: const InputDecoration(hintText: 'Email', border: OutlineInputBorder()),
                            onChanged: (value) {
                              context.read<LoginBloc>().add(EmailInput(email: value));
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter email';
                              }
                              return null;
                            },
                            onFieldSubmitted: (value) {
                              FocusScope.of(context).requestFocus(passwordFocusNode);
                            },
                          ),
                        );
                      }),
                  const SizedBox(
                    height: 20,
                  ),
                  BlocBuilder<LoginBloc, LoginState>(
                      buildWhen: (current, previous) => current.password != previous.password,
                      builder: (context, state) {
                        return SizedBox(
                          width: 300.0,
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            focusNode: passwordFocusNode,
                            decoration: const InputDecoration(hintText: 'Password', border: OutlineInputBorder()),
                            onChanged: (value) {
                              context.read<LoginBloc>().add(PasswordInput(password: value));
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter password';
                              }
                              return null;
                            },
                            
                          ),
                        );
                      }),
                  const SizedBox(
                    height: 50,
                  ),
                  BlocListener<LoginBloc, LoginState>(
                    listener: (context, state) {
                      if (state.loginStatus == LoginStatus.error) {
                        ScaffoldMessenger.of(context)
                          ..hideCurrentSnackBar()
                          ..showSnackBar(
                            SnackBar(
                              content: Text(state.message.toString()),
                              backgroundColor: Colors.red,
                            ),
                          );
                      }

                      if (state.loginStatus == LoginStatus.loading) {
                        ScaffoldMessenger.of(context)
                          ..hideCurrentSnackBar()
                          ..showSnackBar(
                            const SnackBar(content: Text('loading')),
                          );
                      }

                      if (state.loginStatus == LoginStatus.success) {
                        ScaffoldMessenger.of(context)
                          ..hideCurrentSnackBar()
                          ..showSnackBar(
                            const SnackBar(
                              content: Text('Login successfull'),
                              backgroundColor: Colors.green,
                              duration: Duration(seconds: 2),
                            ),
                          );
                          Navigator.pushNamed(context, RoutesName.homeScreen);

                      }
                    },
                    child: BlocBuilder<LoginBloc, LoginState>(
                        buildWhen: (current, previous) => false,
                        builder: (context, state) {
                          return Container(
                            width: 300,
                            child: ElevatedButton(
                                style:ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red,
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0))
                                ) ,
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    context.read<LoginBloc>().add(LoginApi());
                                  }
                                },
                                child: const Text('Login')),
                          );
                        }),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}