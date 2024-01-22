import 'package:flutter/material.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'package:flutter_multiple_languages/l10n/l10n.dart';
// import 'package:flutter_multiple_languages/provider/locale_provider.dart';
import 'package:flutter_multiple_languages/utils/btn_color.dart';

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
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text("Flutter splash screen uses the video as a background [Provider State Management]"),
            ),
  

        const SizedBox(
          height: 10,
        ),

        GradientBorderButton(
          onPressed: () { 
            //add functionality
           }, 
          text: 'Button',

        ),

        const SizedBox(
          height: 10,
        ),




          ],
        ),
      ),
    );
  }
}




// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   // ignore: library_private_types_in_public_api
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(AppLocalizations.of(context)!.app_title),
//         centerTitle: true,
//       ),
//       body: Center(
//         child: Consumer<LocaleProvider>(
//           builder: (context, provider, child) {
//             return Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   AppLocalizations.of(context)!.app_title,
//                   style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//                 ),
//                 const SizedBox(height: 16),
//                 Text(
//                   AppLocalizations.of(context)!.hello_world,
//                   style: const TextStyle(fontSize: 18),
//                 ),
//                 const SizedBox(height: 32),
//                 DropdownButton<Locale>(
//                   value: provider.locale,
//                   onChanged: (newLocale) {
//                     provider.setLocale(newLocale!);
//                   },
//                   items: L10n.all.map<DropdownMenuItem<Locale>>((locale) {
//                     return DropdownMenuItem<Locale>(
//                       value: locale,
//                       child: Text(locale.languageCode),
//                     );
//                   }).toList(),
//                 ),
//               ],
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
