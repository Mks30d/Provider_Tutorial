import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(_count.toString(), style: TextStyle(fontSize: 20)),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _count++;
                });
              },
              child: Text("Increment"),
            ),
          ],
        ),
      ),
    );
  }
}
