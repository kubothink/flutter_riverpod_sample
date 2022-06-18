import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_sample/read_page.dart';

// Can read this value from app global scope.
final helloWorldProvider = Provider((ref) => 'Hello World');
void main() {
  // Must set ProviderScope for App.
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const MyHomePage(title: 'Flutter Riverpod Sample'),
    );
  }
}

/// Widget class should extends for StatelessWidget.
class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Card(
            child: ListTile(
              leading: const CircleAvatar(
                child: Icon(Icons.face),
              ),
              title: const Text('Read'),
              subtitle: const Text('Read provider value'),
              trailing: const Icon(Icons.keyboard_arrow_right),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const ReadPage();
                }));
              },
            ),
          ),
        ],
      ),
    );
  }
}
