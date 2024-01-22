import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_multiple_languages/provider/language_provider.dart';
import 'package:flutter_multiple_languages/utils/btn_color.dart';
import 'package:provider/provider.dart'; // Import the AppLocalizations

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
// Access the AppLocalizations instance

    return Scaffold(
      appBar: AppBar(
         title: Text(AppLocalizations.of(context)!.app_title),
      ),
      body: Center(
        child: Consumer<LanguageProvider>(
          builder: (context, provider, child){
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  AppLocalizations.of(context)!.hello_world,
                  style: const TextStyle(fontSize: 18),
                ),
              const SizedBox(
                height: 10,
              ),
              GradientBorderButton(
                onPressed: () {
                  // add functionality
                },
                text: AppLocalizations.of(context)!.hello_world,
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          );
          }
        ),
      ),
    );
  }
}
