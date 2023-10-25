import 'package:flutter/material.dart';
import 'package:flutter_todover/Common/my_routers.dart';

class PlayListPage extends StatefulWidget {
  const PlayListPage({super.key});

  @override
  State<PlayListPage> createState() => _PlayListPageState();
}

class _PlayListPageState extends State<PlayListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ElevatedButton(
          child: const Text('ir a NowPlaingPage'),
        onPressed: () => {
          Navigator.pushNamed(context, routNowPlay)
        },)
      )
    );
  }
}