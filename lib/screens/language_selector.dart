
import 'package:flutter/material.dart';
import 'package:flutter_multiple_languages/provider/language_provider.dart';
import 'package:provider/provider.dart';

class LanguageSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<LanguageProvider>(context);

    return ListView.builder(
      itemCount: languageProvider.languages.length,
      itemBuilder: (context, index) {
        var language = languageProvider.languages[index];
        return ListTile(
          leading: Image.asset('flags/${language.code}.png'), // Add path to your flag images
          title: Text(language.name),
          trailing:
              language.isSelected ? Icon(Icons.check_circle, color: Colors.orange) : null,
          onTap: () => languageProvider.selectLanguage(language),
        );
      },
    );
  }
}

class Language {
  final String name;
  final String code;
  bool isSelected;

  Language(this.name, this.code, this.isSelected);
}
