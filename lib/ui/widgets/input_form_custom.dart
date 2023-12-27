import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class FilledInputCustom extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;

  const FilledInputCustom({super.key, required this.hintText, this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,

      decoration: InputDecoration(
          filled: true,
          fillColor: whiteColor,
          hintText: hintText,
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),

          hintStyle: lightGreyTextStyle.copyWith(
            fontSize: 16,
            fontWeight: medium,
          ),

          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(12),
          ),

          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: primaryBlueColor
            ),
            borderRadius: BorderRadius.circular(12),
          )
      ),
    );
  }
}
