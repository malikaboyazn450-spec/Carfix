import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text("فاحص أعطال السيارات")),
        body: const Center(
          child: Text("مرحباً بك يا أبو يزن، التطبيق يعمل بنجاح!"),
        ),
      ),
    );
  }
}
