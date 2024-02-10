import 'dart:async';

import 'package:flutter/material.dart';
import 'package:new_ng_demo5/pages/signin_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  _openSignInPage() {
    Navigator.pushReplacementNamed(context, SignInPage.id);
  }

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      _openSignInPage();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromRGBO(193, 53, 132, 1),
            Color.fromRGBO(131, 58, 180, 1),
          ]
        )
      ),
      child: Stack(
        children: [
          // Center(
          //   child: Image.asset(
          //     "assets/images/ic_logo.png",
          //     width: 150,
          //     height: 150,
          //   ),
          // ),
          Center(
            child: Text(
              "Instagram",
              style: TextStyle(
                fontFamily: "Billabong",
                color: Colors.white,
                fontSize: 45
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 10),
            alignment: Alignment.bottomCenter,
            child: Text(
              "Powered by Meta",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          )
        ],
      ),
    ));
  }
}
