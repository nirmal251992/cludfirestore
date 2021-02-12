import 'package:flutter/material.dart';
import 'package:login_signup_demo/constants.dart';


class ForgetPage extends StatefulWidget {
  @override
  _ForgetPageState createState() => _ForgetPageState();
}

class _ForgetPageState extends State<ForgetPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.appColor,
        title: Text("Forgot Password"),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          child: Text("Forgot"),
        ),
      ),
    );
  }
}
