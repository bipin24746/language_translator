import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:language_translator/homepage.dart';
import 'package:language_translator/selectLanguage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Homepage(),
      getPages: [GetPage(name: "/language", page: () => SelectLanguage())],
    );
  }
}
