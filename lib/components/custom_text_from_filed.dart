import 'package:flutter/material.dart';
import 'package:notes_app/components/constants.dart';

class CustomTextFromField extends StatelessWidget {
  const CustomTextFromField({
    super.key,
    required this.title,
    this.maxLines = 1,
    this.onSaved,
    required this.text,
    this.onChange,
  });

  final String text;
  final String title;
  final int maxLines;
  final void Function(String?)? onSaved;
  final void Function(String?)? onChange;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      onChanged: onChange,
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'This field is required';
        }
        return null;
      },
      textAlignVertical: TextAlignVertical.center,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: title,
        hintStyle: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: KPrimaryColor,
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.white, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: KPrimaryColor, width: 2),
        ),
      ),
    );
  }
}
