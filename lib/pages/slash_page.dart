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
        body: Stack(
      children: [
        Center(
          child: Image.asset(
            "assets/images/ic_logo.png",
            width: 150,
            height: 150,
          ),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 10),
          alignment: Alignment.bottomCenter,
          child: Text(
            "Powered by Meta1",
            style: TextStyle(fontSize: 20, color: Colors.black87),
          ),
        )
      ],
    ));
  }
}
