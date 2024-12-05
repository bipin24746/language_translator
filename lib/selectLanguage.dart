import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:language_translator/languageController.dart';

class SelectLanguage extends StatefulWidget {
  const SelectLanguage({super.key});

  @override
  State<SelectLanguage> createState() => _SelectLanguageState();
}

class _SelectLanguageState extends State<SelectLanguage> {
  Languagecontroller languagecontroller = Get.put(Languagecontroller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "Select Language",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Expanded(child: Obx(() {
            return ListView.builder(
                itemCount: languagecontroller.Languages.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(languagecontroller.Languages[index]),
                  );
                });
          }))
        ],
      ),
    );
  }
}
