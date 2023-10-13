import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  String _responseData = '';
  int _counter = 0;

  Future<void> _displayData() async {
    var url = Uri.https('dummyjson.com', '/todos');
    var response = await http.get(url);

    setState(() {
      if (response.statusCode == 200) {
        _responseData = response.body;
        _counter++;
      } else {
        _responseData = 'Failed to fetch data';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '$_responseData',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _displayData,
        tooltip: 'Show Data',
        child: const Icon(Icons.add),
      ),
    );
  }
}
