import 'package:flutter/material.dart';

class GradientBorderButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const GradientBorderButton({
    Key? key, // Use Key? here
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 18),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color.fromARGB(255, 255, 145, 0), Color.fromARGB(255, 247, 188, 100)],
          ),
                    
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: Colors.transparent, // No background color, only border
           // width: 2, // Adjust the border width as needed
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
