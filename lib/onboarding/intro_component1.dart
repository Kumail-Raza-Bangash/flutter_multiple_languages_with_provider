import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroComponent extends StatefulWidget {
  final String image;
  final Color bgColor;
  final String promoText;
  final String additionalText1;

  const IntroComponent({
    Key? key,
    required this.image,
    required this.bgColor,
    required this.promoText,
    required this.additionalText1,
  }) : super(key: key);

  @override
  State<IntroComponent> createState() => _IntroComponentState();
}

class _IntroComponentState extends State<IntroComponent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipOval(
          child: Container(
            height: 300, // Adjust the height as needed
            width: 300, // Adjust the width as needed
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.grey, // Adjust border color
                width: 5.0, // Adjust border width
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.orange.withOpacity(0.3), // Adjust shadow color
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 5), // Adjust shadow offset
                ),
              ],
            ),
            child: CircleAvatar(
              backgroundImage: AssetImage(widget.image),
              backgroundColor: Colors.transparent,
            ),
          ),
        ),
    
        const SizedBox(
          height: 250.0,
        ),
    
        // Text 1
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ShaderMask(
            shaderCallback: (Rect bounds) {
              return const LinearGradient(
                colors: [
                  Color.fromARGB(255, 255, 145, 0),
                  Color.fromARGB(255, 247, 188, 100),
                  Color.fromARGB(255, 255, 145, 0),
                ],
              ).createShader(bounds);
            },
            child: Text(
              widget.promoText,
              style: GoogleFonts.poppins(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white, // Text color
              ),
            ),
          ),
        ),
    
        //Text 2
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            widget.additionalText1,
            style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                  color: Colors.grey, // Text color
                ),
          ),
        ),
      ],
    );
  }
}
