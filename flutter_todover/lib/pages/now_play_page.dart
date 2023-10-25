import 'package:flutter/material.dart';
import 'package:flutter_todover/Common/my_routers.dart';

class NowPlayPage extends StatefulWidget {
  const NowPlayPage({super.key});

  @override
  State<NowPlayPage> createState() => _NowPlayPageState();
}

class _NowPlayPageState extends State<NowPlayPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ElevatedButton(
          child: const Text('Ir a home Page'),
        onPressed: () => {
          Navigator.pushNamed(context, routeHome)
        },)
      )
    );
  }
}