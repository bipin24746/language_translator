import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import '../controllers/translation_controller.dart';

class HomePage extends StatelessWidget {
  final TranslationControllers controller = Get.put(TranslationControllers());
  final stt.SpeechToText speech = stt.SpeechToText();
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Translator App'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Source and Target Language Selection Section
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    // Source Language Dropdown
                    Obx(() {
                      final languageList = _languageList();
                      if (!languageList.any((item) =>
                          item.value == controller.fromLanguage.value)) {
                        controller.fromLanguage.value =
                            languageList.first.value!; // Set default if invalid
                      }
                      return DropdownButton<String>(
                        value: controller.fromLanguage.value,
                        items: languageList,
                        onChanged: (value) {
                          controller.fromLanguage.value = value!;
                          controller.translateText();
                        },
                        isExpanded: true,
                        hint: Text("Select source language"),
                      );
                    }),

                    SizedBox(height: 8),

                    // Swap Button
                    IconButton(
                      icon:
                          Icon(Icons.swap_horiz, size: 28, color: Colors.blue),
                      onPressed: _swapLanguages,
                      tooltip: 'Swap Languages',
                    ),
                    SizedBox(height: 8),

                    // Target Language Dropdown
                    Obx(() {
                      return DropdownButton<String>(
                        value: controller.toLanguage.value,
                        items: _languageList(),
                        onChanged: (value) {
                          controller.toLanguage.value = value!;
                          controller.translateText();
                        },
                        isExpanded: true,
                        hint: Text("Select target language"),
                      );
                    }),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),

            // Input Text Field with Mic Button
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Enter Text:',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: textEditingController,
                            onChanged: (value) {
                              controller.inputText.value = value;
                              controller.translateText();
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              hintText: 'Enter text or use mic',
                            ),
                            maxLines: 3,
                          ),
                        ),
                        SizedBox(width: 8),
                        CircleAvatar(
                          radius: 24,
                          backgroundColor: Colors.blue,
                          child: IconButton(
                            icon: Icon(Icons.mic, color: Colors.white),
                            onPressed: _startListening,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),

            // Translated Text Display with Speaker Button
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Obx(() {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Translation:',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                controller.translatedText.value.isEmpty
                                    ? 'Translation will appear here'
                                    : controller.translatedText.value,
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ),
                          SizedBox(width: 8),
                          CircleAvatar(
                            radius: 24,
                            backgroundColor: Colors.blue,
                            child: IconButton(
                              icon: Icon(Icons.volume_up, color: Colors.white),
                              onPressed: controller.speakTranslatedText,
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper function to provide a list of languages
  List<DropdownMenuItem<String>> _languageList() {
    final languages = {
      'en': 'English',
      'ne': 'Nepali',
      'ja': 'japanese',
      'hi': 'hindi',
      'bho': 'Bhojpuri',
    };

    return languages.entries
        .map((entry) => DropdownMenuItem(
              value: entry.key,
              child: Text(entry.value),
            ))
        .toList();
  }

  // Function to handle voice input
  Future<void> _startListening() async {
    bool available = await speech.initialize(
      onStatus: (status) => print('Status: $status'),
      onError: (error) => print('Error: $error'),
    );

    if (available) {
      speech.listen(onResult: (result) {
        textEditingController.text = result.recognizedWords; // Update TextField
        controller.inputText.value =
            result.recognizedWords; // Update Reactive Input
        controller.translateText(); // Trigger Translation
      });
    } else {
      print("The user has denied the microphone permissions.");
    }
  }

  // Function to swap source and target languages
  void _swapLanguages() {
    final currentFromLanguage = controller.fromLanguage.value;
    controller.fromLanguage.value = controller.toLanguage.value;
    controller.toLanguage.value = currentFromLanguage;

    controller.translateText(); // Trigger re-translation with swapped languages
  }
}


// 'ne': 'Nepali',
//       'tam': 'Tamang',
//       'mag': 'Magar',
//       'bho': 'Bhojpuri',