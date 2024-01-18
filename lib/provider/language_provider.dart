
import 'package:flutter/material.dart';
import 'package:flutter_multiple_languages/screens/language_selector.dart';

class LanguageProvider with ChangeNotifier {
  List<Language> languages = [
    Language('Hindi', 'hi', false),
    // Add other languages here
    // ...
    Language('English', 'en', true), 
   ];

   void selectLanguage(Language language){
     languages.forEach((lang)=> lang.isSelected = false);
     language.isSelected = true;
     notifyListeners();
   }
}