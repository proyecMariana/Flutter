import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 184, 223, 11)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter ajustando script'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 10;
  String _phrase = "Haga clic antes de la explosión:";
  TextStyle _tS = const TextStyle(
    color: Colors.green,
    fontSize: 15,
  );
  Color _color = Colors.white;
  void _decrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has

      if (_counter > 0) {
        _counter--;
        _color = Colors.white;
        _phrase = "Haga clic antes de la explosión:";
        _tS = const TextStyle(
          color: Colors.green,
          fontSize: 15,
        );
      }
      if (_counter == 0) {
        _phrase = "BOOM";
        _tS = const TextStyle(
          color: Colors.red,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        );

        _color = Colors.amber;
        _counter = 10;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '$_phrase',
              style: _tS,
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.displayLarge,
            ),
          ],
        ),
      ),
      backgroundColor: _color,
      floatingActionButton: FloatingActionButton(
        onPressed: _decrementCounter,
        tooltip: 'Cuenta atrás',
        child: const Icon(Icons.add_a_photo_sharp),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
