import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Column(
      children: [
        Image.asset("assets/images/login.png"),
        Text(
          "Welcome",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                    hintText: "Enter Username", labelText: "User Name"),
              ),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                    hintText: "Enter Password", labelText: "Password"),
              )
            ],
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        ElevatedButton(
            onPressed: () {
              print("hi");
            },
            style: TextButton.styleFrom(),
            child: Text("Login")),
      ],
    ));
  }
}
