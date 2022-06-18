import 'package:carousel_app/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton = false;
  int ani = 1;
  @override
  Widget build(BuildContext context) {
    return Material(
        child: SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 50.0,
          ),
          Image.asset(
            "assets/images/login.png",
            height: 225,
          ),
          Text(
            "Welcome $name",
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                      hintText: "Enter Username", labelText: "User Name"),
                  onChanged: (value) {
                    name = value;
                    setState(() {});
                  },
                ),
                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                      hintText: "Enter Password", labelText: "Password"),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          InkWell(
              onTap: () async {
                setState(() {
                  changeButton = true;
                });
                setState(() {
                  ani = 2;
                });
                await Future.delayed(const Duration(seconds: 1));
                // changeButton = false;
                Navigator.pushNamed(context, MyRoutes.homeRoute);
              },
              child: AnimatedContainer(
                duration: const Duration(seconds: 1),
                width: changeButton ? 38 : 150,
                height: 40,
                alignment: Alignment.center,
                child: ani == 2
                    ? Icon(
                        Icons.done,
                        color: Colors.white,
                      )
                    : Text(
                        changeButton ? "" : "Login",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  //shape: changeButton ? BoxShape.circle : BoxShape.rectangle
                  borderRadius: BorderRadius.circular(changeButton ? 50 : 8),
                ),
              ))
          // ElevatedButton(
          //     onPressed: () {
          //       Navigator.pushNamed(context, MyRoutes.homeRoute);
          //     },
          //     style: TextButton.styleFrom(
          //       minimumSize: const Size(150, 40),
          //     ),
          //     child: const Text("Login")),
        ],
      ),
    ));
  }
}
