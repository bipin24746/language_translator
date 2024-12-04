import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                child: const TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Enter text to translate",
                  ),
                  maxLines: null,
                  expands: true, // Allows the TextField to fill its parent
                ),
              ),
              // Bottom section
              Container(
                height: availableHeight * 0.5 - 30, // Same as top section
                margin: const EdgeInsets.all(8.0),
                color: Colors.white,
                child: const Center(
                  child: Text(
                    "Bottom Half",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Positioned(
                top: availableHeight * 0.6 - 110, // Adjust as needed
                child: FloatingActionButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  onPressed: () {},
                  backgroundColor: Colors.blue,
                  child: Icon(
                    Icons.arrow_right,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Positioned(
                top: availableHeight * 0.6 - 110, // Adjust as needed
                child: FloatingActionButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  onPressed: () {},
                  backgroundColor: Colors.blue,
                  child: Icon(
                    Icons.arrow_upward,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: kBottomNavigationBarHeight, // Ensure consistent height
          alignment: Alignment.center,
          child: const Text(
            "Reserved Ad Unit Space",
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}
