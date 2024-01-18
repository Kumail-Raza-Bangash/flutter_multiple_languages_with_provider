import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryColor = Color.fromARGB(255, 243, 128, 33);
  static const Color secondaryColor = Color.fromARGB(255, 255, 249, 212);
  static const Color color1 = Color.fromARGB(255, 238, 80, 32);
  static const Color color2 = Color.fromARGB(255, 238, 120, 16);
  static const Color color3 = Color.fromARGB(255, 238, 62, 8);

  static const LinearGradient gradientBackground = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [color1, color2, color3,],
  );
}


// return Container(
//       decoration: BoxDecoration(
//         gradient: AppColors.gradientBackground,
//       ),
//     );
