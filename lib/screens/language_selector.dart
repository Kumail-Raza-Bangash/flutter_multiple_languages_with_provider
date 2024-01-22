import 'package:flutter/material.dart';
import 'package:flutter_multiple_languages/provider/language_provider.dart';
import 'package:flutter_multiple_languages/screens/intro_screen.dart';
import 'package:flutter_multiple_languages/utils/colors.dart';
import 'package:provider/provider.dart';

class LanguageSelector extends StatefulWidget {
  const LanguageSelector({Key? key}) : super(key: key);

  @override
  State<LanguageSelector> createState() => _LanguageSelectorState();
}

class _LanguageSelectorState extends State<LanguageSelector> {
  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<LanguageProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: AppColors.gradientBackground,
          ),
        ),
        title: const Text(
          'Languages',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                // Navigate to the HomePage when the check icon is clicked
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const IntroScreen()),
                );
              },
              child: const Icon(Icons.check, color: Colors.white),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: languageProvider.languages.length,
        itemBuilder: (context, index) {
          var language = languageProvider.languages[index];
          return Column(
            children: [
              const SizedBox(height: 16),
              SizedBox(
                height: 70,
                child: Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Colors.grey, width: 0),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 45,
                              height: 45,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey, width: 1),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: ClipOval(
                                child: Image.asset(
                                  'lib/assets/flags/${language.code}.png',
                                  width: 50,
                                  height: 50,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Text(language.name),
                          ],
                        ),
                        Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: language.isSelected
                                  ? Colors.orange
                                  : Colors.grey,
                              width: language.isSelected ? 2.5 : 1.5,
                            ),
                          ),
                          child: Center(
                            child: language.isSelected
                                ? const Icon(Icons.circle, color: Colors.orange, size: 10)
                                : null,
                          ),
                        ),
                      ],
                    ),
                    onTap: () {
                      languageProvider.selectLanguage(language);
                      languageProvider.setLocale(Locale(language.code));
                      // Navigate to the HomePage after selecting the language
                      
                    },
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
