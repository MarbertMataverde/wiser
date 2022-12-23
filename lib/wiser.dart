import 'package:flutter/material.dart';

class WiserApp extends StatelessWidget {
  const WiserApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wiser - Your budget buddy anywhere!',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const WiserHome(),
    );
  }
}

class WiserHome extends StatelessWidget {
  const WiserHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Wiser Home'),
      ),
    );
  }
}
