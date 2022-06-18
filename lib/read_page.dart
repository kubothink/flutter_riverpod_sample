import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_sample/main.dart';

class ReadPage extends StatelessWidget {
  const ReadPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Use Consumer Widget as cover for state cahnge widget scope.
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final helloWorld = ref.read(helloWorldProvider);

        return Scaffold(
          appBar: AppBar(
            title: const Text('Read Samples'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: double.infinity,
                  height: 60.0,
                  child: Card(
                    // margin: EdgeInsets.all(4),
                    // color: Colors.grey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 8.0),
                      child: Text(
                        helloWorld,
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
