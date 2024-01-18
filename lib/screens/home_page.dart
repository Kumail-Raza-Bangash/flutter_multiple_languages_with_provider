// home_page.dart

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('HOME PAGE'),
      ),
      body:  const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text("Flutter splash screen uses the video as a background [Provider State Management]"),
            ),
  

        SizedBox(
          height: 10,
        ),


          ],
        ),
      ),
    );
  }
}
