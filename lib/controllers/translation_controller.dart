import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:translator/translator.dart';

class TranslationControllers extends GetxController {
  var fromLanguage = 'en'.obs; // Default source language is English
  var toLanguage = 'ne'.obs; // Default target language is Spanish
  var inputText = ''.obs; // User input text
  var translatedText = ''.obs; // Translated text

  final GoogleTranslator translator = GoogleTranslator();
  final FlutterTts tts = FlutterTts();

  // Function to translate input text
 Future<void> translateText() async {
  if (inputText.value.isNotEmpty) {
    try {
      var translation = await translator.translate(
        inputText.value,
        from: fromLanguage.value,
        to: toLanguage.value,
      );
      translatedText.value = translation.text;
    } catch (e) {
      if (e.toString().contains('LanguageNotSupportedException')) {
        translatedText.value = "Error: The selected language is not supported.";
      } else {
        translatedText.value = "Error: Translation failed.";
      }
      print("Translation Error: $e");
    }
  } else {
    translatedText.value = '';
  }
}

  // Function to speak the translated text
  Future<void> speakTranslatedText() async {
    if (translatedText.value.isNotEmpty) {
      await tts.setLanguage(toLanguage.value);
      await tts.speak(translatedText.value);
    }
  }
}
