
import 'package:flutter/material.dart';
import 'package:flutter_multiple_languages/model/language_model.dart';

class LanguageProvider with ChangeNotifier {
  List<Language> languages = [    
    Language('English', 'en', true), 
    Language('اردو', 'ur', false),
    Language('française', 'fr', false),
    Language('한국어', 'ko', false),
    Language('हिंदी', 'hi', false),
    Language('español', 'sp', false),
    
   ];

   void selectLanguage(Language language){
     for (var lang in languages) {
       lang.isSelected = false;
     }
     language.isSelected = true;
     notifyListeners();
   }
}