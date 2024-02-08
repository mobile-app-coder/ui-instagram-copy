import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static final id = "home_page";

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Instagram",
          style: TextStyle(
              fontFamily: "Billabong", fontSize: 40, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Text(
          "you are welcome",
          style: TextStyle(
              fontSize: 45, color: Colors.blueGrey, fontFamily: "Billabong"),
        ),
      ),
    );
  }
}
