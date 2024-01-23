import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_multiple_languages/onboarding/intro_component1.dart';
import 'package:flutter_multiple_languages/provider/page_provider.dart';
import 'package:flutter_multiple_languages/screens/home_page.dart';
import 'package:flutter_multiple_languages/utils/btn_color.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key,});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();
    controller.addListener(() {
      context.read<PageProvider>().scrollPage(controller.page);
    });

    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller,
            children: [
              IntroComponent(
                image: 'lib/assets/images/ob1.png',
                bgColor: const Color.fromARGB(255, 255, 255, 255),
                promoText: AppLocalizations.of(context)!.onboard_title1,
                additionalText1: AppLocalizations.of(context)!.onboard_description1,
              ),
              IntroComponent(
                image: 'lib/assets/images/ob2.png',
                bgColor: const Color.fromARGB(255, 255, 255, 255),
                promoText:  AppLocalizations.of(context)!.onboard_title2,
                additionalText1: AppLocalizations.of(context)!.onboard_description2,
              ),
              IntroComponent(
                image: 'lib/assets/images/ob3.png',
                bgColor: const Color.fromARGB(255, 255, 255, 255),
                promoText:  AppLocalizations.of(context)!.onboard_title3,
                additionalText1: AppLocalizations.of(context)!.onboard_description3,
              ),
            ],
          ),
          Positioned(
            bottom: 10,
            right: 10,
            child: GradientBorderButton(
              onPressed: () async {
                final SharedPreferences pref =
                    await SharedPreferences.getInstance();
                pref.setBool('isFresher', false);

                if (controller.page != 2) {
                  controller.nextPage(
                    duration: const Duration(milliseconds: 1000),
                    curve: Curves.easeInOut,
                  );
                } else {
                  // ignore: use_build_context_synchronously
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                }
              },
              text: AppLocalizations.of(context)!.next,
            ),
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: CircleAvatar(
                    backgroundColor: context.watch<PageProvider>().page == index
                        ? const Color.fromARGB(255, 255, 145, 0)
                        : const Color.fromARGB(255, 248, 225, 16),
                    radius: context.watch<PageProvider>().page == index ? 5 : 3,
                  ),
                );
              }),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 10,
            child: TextButton(
              onPressed: () {
                // ignore: use_build_context_synchronously
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              },
              child: Text(
                AppLocalizations.of(context)!.skip,
                style: const TextStyle(color: Colors.grey, fontSize: 16, fontStyle: FontStyle.italic),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
