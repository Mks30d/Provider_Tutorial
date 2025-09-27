import 'package:flutter/material.dart';
import 'package:provider_tutorial/home_page.dart';
import 'package:provider/provider.dart';
import 'package:provider_tutorial/list_map_related/list_map_page.dart';
import 'package:provider_tutorial/list_map_related/list_map_provider.dart';
import 'package:provider_tutorial/provider/counter_provider.dart';

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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),

      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => CounterProvider()),
          ChangeNotifierProvider(create: (context) => ListMapProvider()),
        ],
        child: ListMapPage(),
      ),
    );
  }
}
