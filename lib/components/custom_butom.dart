import 'package:flutter/material.dart';
import 'package:notes_app/components/constants.dart';

// ignore: must_be_immutable
class CustomButom extends StatelessWidget {
  CustomButom({
    super.key,
    required this.title,
    required this.onTap,
    this.isLoading = false,
  });

  final String title;
  final VoidCallback onTap;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 50,
        child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            backgroundColor: KPrimaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: isLoading
              ? const CircularProgressIndicator(color: Colors.black)
              : Text(
                  title,
                  style: const TextStyle(
                    fontSize: 22,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
        ),
      ),
    );
  }
}
