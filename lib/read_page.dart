import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_sample/main.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ReadPage extends HookConsumerWidget {
  const ReadPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textStyleHL6 = Theme.of(context).textTheme.headline6;
    String _hwText = 'NULL';
    return Scaffold(
      appBar: AppBar(
        title: const Text('Read Samples'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // Rebuild widget by watched value changed.
            Consumer(
              builder: (BuildContext context, WidgetRef ref, Widget? child) {
                final helloWorld = ref.watch(helloWorldProvider);

                return SizedBox(
                  width: double.infinity,
                  height: 200.0,
                  child: Card(
                    // margin: EdgeInsets.all(4),
                    // color: Colors.grey,
                    child: Center(
                      child: Text(
                        helloWorld,
                        style: textStyleHL6,
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Value read only when pressd.
          final hw = ref.read(helloWorldProvider);
          print(hw);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
