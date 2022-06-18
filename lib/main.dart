import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

/// Widget class should extends for StatelessWidget.
class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    // Use Consumer Widget as cover for state cahnge widget scope.
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final helloWorld = ref.read(helloWorldProvider);

        return Scaffold(
          appBar: AppBar(
            title: Text(title),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  helloWorld,
                  style: Theme.of(context).textTheme.headline4,
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ), // This trailing comma makes auto-formatting nicer for build methods.
        );
      },
    );
  }
}
