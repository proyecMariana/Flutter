import 'package:flutter/material.dart';
import 'package:flutter_music/pages/loginpage.dart';
import 'package:flutter_music/pages/my_home_page.dart';
import 'package:flutter_music/pages/now_play_page.dart';
import 'package:flutter_music/pages/play_list_page.dart';



const String routeHome = "/home";
const String routeLogin = "/login";
const String routePlayList = "/play_list";
const String routNowPlay = "/now_play";

class MyRouters {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/home":
        return MaterialPageRoute(builder: (_) => const MyHomePage());
      case "/login":
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case "/play_list":
        return MaterialPageRoute(builder: (_) => const PlayListPage());
      case "/now_play":
        return MaterialPageRoute(builder: (_) => const NowPlayingPage());
      default:
        return MaterialPageRoute(builder: (_) => const LoginPage());
    }
  }
}