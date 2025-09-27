import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_tutorial/provider/counter_provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // currently complete widget is being rebuilt on notifyListeners
    debugPrint("widget build...");

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Consumer<CounterProvider>(
              builder: (consumerContext, _, _) {
                debugPrint("Consumer build...");
                return Text(
                  "${Provider.of<CounterProvider>(consumerContext, listen: true).getCount()}",
                  style: TextStyle(fontSize: 20),
                );
              },
            ),

            ElevatedButton(
              onPressed: () {
                Provider.of<CounterProvider>(context, listen: false,).incrementCount();
              },
              child: Text("Increment"),
            ),

            ElevatedButton(
              onPressed: () {
                Provider.of<CounterProvider>(context, listen: false,).decrementCount();
              },
              child: Text("Decrement"),
            ),
          ],
        ),
      ),
    );
  }
}
