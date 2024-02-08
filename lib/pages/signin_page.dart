import 'package:flutter/material.dart';
import 'package:new_ng_demo5/pages/home_page.dart';
import 'package:new_ng_demo5/pages/signup_page.dart';

class SignInPage extends StatefulWidget {
  static final id = "singin_page";

  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  _signIn(){
    Navigator.pushReplacementNamed(context, HomePage.id);
  }

  _openSignUpPage() {
    Navigator.pushReplacementNamed(context, SignUpPage.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Instagram",
                style: TextStyle(
                    fontSize: 45, color: Colors.black, fontFamily: "Billabong"),
              ),
              Container(
                height: 48,
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(5)),
                child: TextField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal)),
                      hintText: "Email",
                      hintStyle: TextStyle(color: Colors.grey)),
                ),
              ),
              SizedBox(height: 10),
              Container(
                height: 48,
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(5)),
                child: TextField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal)),
                      hintText: "Password",
                      hintStyle: TextStyle(color: Colors.grey)),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                height: 48,
                child: MaterialButton(
                  color: Colors.blue,
                  onPressed: () {},
                  textColor: Colors.white,
                  child: Text("Sign in"),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("Don't have an account"),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    child: Text(
                      "Sign up",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                      _openSignUpPage();
                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
