import 'package:flutter/material.dart';

class AuvnetStoreApp extends StatelessWidget {
  const AuvnetStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Auvnet Store',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Auvnet Store'),
        ),
      ),
    );
  }
}