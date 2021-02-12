import 'package:flutter/material.dart';
import 'package:login_signup_demo/constants.dart';
import '../common_widgets.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passcontroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  _sendToServer() {
    Navigator.pushReplacementNamed(context, Routes.dashboard);
    // if (_formKey.currentState.validate()) {
    //   // No any error in validation
    //   _formKey.currentState.save();
    //   print("Email ${emailcontroller.text}");
    //   print("Password ${passcontroller.text}");
    // } else {
    //   // validation error
    //   // setState(() {
    //   //  // _validate = true;
    //   // });
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Login",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                    SizedBox(height: 30),
                    Container(
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(242, 243, 244, 1.0),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: TextFormField(
                            validator: Validators.validateEmail,
                            controller: emailcontroller,
                            decoration: InputDecoration(
                                border: InputBorder.none, hintText: "Email"
                                // labelText: "Email"
                                )),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(242, 243, 244, 1.0),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: TextFormField(
                            controller: passcontroller,
                            obscureText: true,
                            validator: Validators.validatePassword,
                            decoration: InputDecoration(
                                border: InputBorder.none, hintText: "Password"
                                // labelText: "Email"
                                )
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    FlatButton(
                        minWidth: double.infinity,
                        height: 40,
                        color: Constants.appColor,
                        //   disabledColor: Color.fromRGBO(247, 149, 50, 1.0),
                        onPressed: () {
                          _sendToServer();
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        )),
                    Align(
                        alignment: Alignment.centerRight,
                        child: FlatButton(
                          onPressed: () {
                            Navigator.pushNamed(context, Routes.forgot);
                          },
                          child: Text('Forgot Password?'),
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an account?"),
                        FlatButton(
                            onPressed: () {
                              Navigator.pushNamed(context, Routes.signup);
                            },
                            child: Text(
                              "SignUp",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
