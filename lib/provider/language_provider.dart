
import 'package:flutter/material.dart';
import 'package:flutter_multiple_languages/l10n/l10n.dart';
import 'package:flutter_multiple_languages/model/language_model.dart';

class LanguageProvider with ChangeNotifier {

  Locale? _locale;

  Locale? get locale => _locale;

  void setLocale(Locale locale) {
    if (!L10n.all.contains(locale)) return;
      _locale = locale;
      notifyListeners();
    
  }
  
  List<Language> languages = [    
    Language('English', 'en', true), 
    Language('中国人', 'ch', false),
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