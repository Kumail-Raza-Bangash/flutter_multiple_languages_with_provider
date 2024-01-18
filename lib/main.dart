import 'package:flutter/material.dart';
import 'package:flutter_multiple_languages/provider/language_provider.dart';
import 'package:flutter_multiple_languages/screens/language_selector.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LanguageProvider(),
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: Text('Language')),
          body: LanguageSelector(),
        ),
      ),
    );
  }
}
