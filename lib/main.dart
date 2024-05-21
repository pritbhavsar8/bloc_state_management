import 'package:bloc_state_management/Routes/routes.dart';
import 'package:bloc_state_management/Routes/routes_name.dart';
import 'package:bloc_state_management/View/Screen/CounterScreen.dart';
import 'package:bloc_state_management/View/Screen/HomeScreen.dart';
import 'package:bloc_state_management/bloc/Get_Api/api_bloc.dart';
import 'package:bloc_state_management/bloc/counter_blog/counter_bloc.dart';
import 'package:bloc_state_management/bloc/switch_bloc/bloc/switch_bloc.dart';
import 'package:bloc_state_management/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) =>CounterBloc(),),
        BlocProvider(create: (context) =>ApiBloc(),),
         BlocProvider(create: (context) =>SwitchBloc(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // TRY THIS: Try running your application with "flutter run". You'll see
          // the application has a purple toolbar. Then, without quitting the app,
          // try changing the seedColor in the colorScheme below to Colors.green
          // and then invoke "hot reload" (save your changes or press the "hot
          // reload" button in a Flutter-supported IDE, or press "r" if you used
          // the command line to start the app).
          //
          // Notice that the counter didn't reset back to zero; the application
          // state is not lost during the reload. To reset the state, use hot
          // restart instead.
          //
          // This works for code too, not just values: Most code changes can be
          // tested with just a hot reload.
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: RoutesName.switchScreen,
        onGenerateRoute: Routes.generateRoute,
        // home: HomeScreen(),
      ),
    );
  }
}




