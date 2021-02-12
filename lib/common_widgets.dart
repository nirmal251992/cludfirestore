import 'package:flutter/material.dart';


class Textfields {

 static Widget textfield(String name,TextEditingController controller) {
    return
      Container(
        decoration: BoxDecoration(
          color: Color.fromRGBO(242, 243, 244, 1.0),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: TextFormField(
              decoration: InputDecoration(
                  border: InputBorder.none, hintText: name
                // labelText: "Email"
              )),
        ),
      );
  }
}