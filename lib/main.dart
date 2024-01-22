import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_multiple_languages/l10n/l10n.dart';
import 'package:flutter_multiple_languages/provider/language_provider.dart';
import 'package:flutter_multiple_languages/provider/page_provider.dart';
import 'package:flutter_multiple_languages/provider/splash_screen_provider.dart';
import 'package:flutter_multiple_languages/screens/splash_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SplashProvider(),),
        ChangeNotifierProvider(create: (context) => LanguageProvider(),),
        ChangeNotifierProvider(create: (context) => PageProvider(),),
        // Add more providers if needed
      ],

      child: Consumer<LanguageProvider>(
        builder: (context, provider, snapshot) {
       return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Fluid Wallpaper',
        home: const SplashPage(),
        locale: provider.locale,
        supportedLocales: L10n.all,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
      );
    },
  ),
      
    );
  }
}
