import 'package:flutter/material.dart';
import 'package:flutter_todover/Common/my_routers.dart';
import 'package:flutter_todover/pages/loginpage.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navegacion entre paginas',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: MyRouters.generateRoute,
      initialRoute: routeLogin,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Navegacion entre paginas'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: const Text('Esto es prueba'),
            ),
            const Text(
              'Texto 01',
              textAlign: TextAlign.center,
            ),
            const Text(
              'Texto 03',
              textAlign: TextAlign.left,
            ),
            ElevatedButton(
              child: const Text('Ir a PlayList'),
              onPressed: () => {
                Navigator.pushNamed(context, routePlayList)
                },
            )
          ],
        ),
      ),
    );
  }
}
