
import 'package:flutter/material.dart';
import 'package:flutter_multiple_languages/model/language_model.dart';

class LanguageProvider with ChangeNotifier {
  List<Language> languages = [
    Language('हिंदी', 'hi', false),
    Language('اردو', 'ur', false),
    Language('English', 'en', false), 
    Language('हिंदी', 'hi', false),
    Language('اردو', 'ur', false),
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