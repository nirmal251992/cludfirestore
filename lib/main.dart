import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:login_signup_demo/constants.dart';
import 'package:login_signup_demo/account_screens/forget_page.dart';
import 'package:login_signup_demo/account_screens/login_page.dart';
import 'package:login_signup_demo/account_screens/signup_page.dart';
import 'package:login_signup_demo/dashboard_screens/dashboard.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
        // on the FirstScreen widget.
        initialRoute: '/',
        routes: {
          // When navigating to the "/" route, build the FirstScreen widget.
          Routes.login: (context) => LoginPage(),
          // When navigating to the "/second" route, build the SecondScreen widget.
          Routes.signup: (context) => SignUpPage(),
          Routes.forgot: (context) => ForgetPage(),
          Routes.dashboard:(context) => DashboardPage()
        }
    );
  }
}