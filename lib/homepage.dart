import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:language_translator/selectLanguage.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    // Calculate the available height excluding the AppBar and BottomAppBar
    final availableHeight = Get.height -
        kToolbarHeight -
        kBottomNavigationBarHeight - // Height of BottomAppBar
        MediaQuery.of(context).padding.top;

    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Language Translator",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            children: [
              // Top section
              Container(
                height: availableHeight * 0.5 -
                    30, // Half of the height minus spacing
                margin: const EdgeInsets.all(8.0),
                color: Colors.white,
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Get.toNamed('/language');
                      },
                      child: Row(
                        children: const [
                          Icon(
                            Icons.arrow_downward,
                            color: Colors.blue,
                          ),
                          Text(
                            "English",
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          )
                        ],
                      ),
                    ),
                    const Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Tap to enter text",
                        ),
                        maxLines: null,
                        expands:
                            true, // Allows the TextField to fill its parent
                      ),
                    ),
                  ],
                ),
              ),
              // Bottom section
              Container(
                height: availableHeight * 0.5 -
                    30, // Half of the height minus spacing
                margin: const EdgeInsets.all(8.0),
                color: Colors.white,
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.toNamed('/language');
                      },
                      child: Row(
                        children: const [
                          Icon(
                            Icons.arrow_downward,
                            color: Colors.blue,
                          ),
                          Text(
                            "English",
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          )
                        ],
                      ),
                    ),
                    const Expanded(
                      child: DecoratedBox(
                        decoration: BoxDecoration(),
                        child: Text(
                          "Translation",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: availableHeight * 0.5 -
                40, // Center the FAB between the two sections
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  onPressed: () {},
                  backgroundColor: Colors.blue,
                  child: const Icon(
                    Icons.arrow_right,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 20),
                FloatingActionButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  onPressed: () {},
                  backgroundColor: Colors.blue,
                  child: const Icon(
                    Icons.arrow_upward,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: kBottomNavigationBarHeight, // Ensure consistent height
          alignment: Alignment.center,
          child: const Text(
            "Reserved Ad Unit Space",
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
