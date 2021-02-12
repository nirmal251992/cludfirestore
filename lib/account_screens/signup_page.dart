import 'package:country_code_picker/country_code.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import '../common_widgets.dart';
import '../constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController mobilecontroller = TextEditingController();
  TextEditingController passcontroller = TextEditingController();
  TextEditingController cpasscontroller = TextEditingController();
  var selected_code = "+91";
  CollectionReference ref = FirebaseFirestore.instance.collection("hello");
  final namefocus = FocusNode();
  final emailfocus = FocusNode();
  final mobilefocus = FocusNode();
  final passfocus = FocusNode();
  final cpassfocus = FocusNode();
  String name = "";
  String email = "";
  String mobile = "";
  String pass = "";
  String cpass = "";

  _tap_signup() {
    setState(() {
      name = namecontroller.text;
      email = emailcontroller.text;
      mobile = selected_code + mobilecontroller.text;
      pass = passcontroller.text;
      cpass = cpasscontroller.text;
    });
    FocusScope.of(context).requestFocus(FocusNode());
    print(name);
    ref.add({
      'name': name,
      'email': email,
      'mobile': mobile,
      'password': pass,
      'cpassword': cpass
    }).whenComplete(() => _showAlert(context));
  }
  void clearText() {
    namecontroller.clear();
  }
  void _showAlert(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              actions: [
                FlatButton(
                  child: Text("Ok"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
              title: Text("Successfully Registered"),
              content: Text(""),
            ));
  }

  _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Constants.appColor,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Sign Up",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  SizedBox(height: 30),
                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(242, 243, 244, 1.0),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: TextFormField(
                          focusNode: namefocus,
                          autofocus: false,
                          onSaved: (String val) {
                            setState(() {
                              name = val;
                            });
                          },
                          onFieldSubmitted: (term) {
                            _fieldFocusChange(context, namefocus, emailfocus);
                          },
                          controller: namecontroller,
                          decoration: InputDecoration(
                              border: InputBorder.none, hintText: "Name"
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
                      padding: const EdgeInsets.only(left: 10),
                      child: TextFormField(
                          focusNode: emailfocus,
                          autofocus: false,
                          onSaved: (String val) {
                            setState(() {
                              email = val;
                            });
                          },
                          onFieldSubmitted: (term) {
                            _fieldFocusChange(context, emailfocus, mobilefocus);
                          },
                          controller: emailcontroller,
                          decoration: InputDecoration(
                              border: InputBorder.none, hintText: "Email"
                              // labelText: "Email"
                              )),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      CountryCodePicker(
                        onChanged: (c) {
                          print(c.code);
                          print(c.dialCode);
                          setState(() {
                            selected_code = c.dialCode;
                          });
                        },
                        initialSelection: 'IN',
                        favorite: ['+91', 'IN'],
                      ),
                      Flexible(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(242, 243, 244, 1.0),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: TextFormField(
                              autofocus: false,
                                onSaved: (String val) {
                                  setState(() {
                                    mobile = val;
                                  });
                                },
                                controller: mobilecontroller,
                                decoration: InputDecoration(
                                    border: InputBorder.none, hintText: "Mobile"
                                    // labelText: "Email"
                                    )),
                          ),
                        ),
                      ),
                    ],
                  ),
                  // Textfields.textfield("Mobile", mobilecontroller),
                  SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(242, 243, 244, 1.0),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: TextFormField(
                          focusNode: passfocus,
                          autofocus: false,
                          onSaved: (String val) {
                            setState(() {
                              pass = val;
                            });
                          },
                          onFieldSubmitted: (term) {
                            _fieldFocusChange(context, passfocus, cpassfocus);
                          },
                          controller: passcontroller,
                          decoration: InputDecoration(
                              border: InputBorder.none, hintText: "Password"
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
                      padding: const EdgeInsets.only(left: 10),
                      child: TextFormField(
                          focusNode: cpassfocus,
                          autofocus: false,
                          onSaved: (String val) {
                            setState(() {
                              cpass = val;
                            });
                          },
                          onFieldSubmitted: (term) {
                            _fieldFocusChange(context, cpassfocus, cpassfocus);
                          },
                          controller: cpasscontroller,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Confirm Password"
                              // labelText: "Email"
                              )),
                    ),
                  ),
                  SizedBox(height: 20),
                  FlatButton(
                      minWidth: double.infinity,
                      height: 40,
                      color: Constants.appColor,
                      //   disabledColor: Color.fromRGBO(247, 149, 50, 1.0),
                      onPressed: () {
                        clearText();
                        _tap_signup();
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have an account?"),
                      FlatButton(
                          onPressed: () {
                            Navigator.pop(context, Routes.login);
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ))
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
