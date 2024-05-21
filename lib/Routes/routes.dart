import 'package:bloc_state_management/Routes/routes_name.dart';
import 'package:bloc_state_management/View/Auth/LoginScreen.dart';
import 'package:bloc_state_management/View/Screen/CounterScreen.dart';
import 'package:bloc_state_management/View/Screen/HomeScreen.dart';
import 'package:bloc_state_management/View/Screen/Switch.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Routes
{
 static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case RoutesName.counterScreen:
        return MaterialPageRoute(builder: (context) => CounterScreen(),);
      case RoutesName.homeScreen:
        return MaterialPageRoute(builder: (context) => HomeScreen(),);
      case RoutesName.loginScreen:
        return MaterialPageRoute(builder: (context) => LoginScreen(),);
         case RoutesName.switchScreen:
        return MaterialPageRoute(builder: (context) => SwitchExample(),);
      default:
        return MaterialPageRoute(builder: (context){
          return Scaffold(
            body: Center(
              child: Text("No routes generates"),
            ),
          );
        });

    }
  }

}