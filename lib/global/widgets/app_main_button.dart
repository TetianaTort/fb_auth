import 'package:flutter/material.dart';

class AppMainButton extends StatelessWidget {
  final Color backgroundColor;
  final String? title;
  final String? imagePath;
  const AppMainButton({
    super.key,
    required this.backgroundColor,
    this.title,
    this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(backgroundColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0), // Adjust the radius as needed
            ),
          ),
        ),
        child: imagePath != null
            ? Image.asset(
                imagePath!,
              )
            : Text(
                title ?? 'Button',
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
      ),
    );
  }
}
