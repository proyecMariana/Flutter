import 'package:flutter/material.dart';
import 'package:flutter_todover/Common/my_routers.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ElevatedButton(
          child: const Text('My home Page'),
        onPressed: () => {
          Navigator.pushNamed(context, routeHome)
        },)
      )
    );
  }
}