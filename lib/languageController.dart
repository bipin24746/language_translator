import 'package:get/get.dart';

class Languagecontroller extends GetxController {
  var Languages = <String>["English", "Nepali", "Newari"].obs;
}

changeLanguage() {
  List<String> changeLanguage =
      List.generate(rtlLanguages.length, (index) => 'Item $index');
}
