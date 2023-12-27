import 'package:flutter/material.dart';
import 'package:suitmedia_submission/shared/theme.dart';

class FilledButtonCustom extends StatelessWidget {
  final double width;
  final double height;
  final String label;
  final Function onTap;

  const FilledButtonCustom({
    super.key,
    required this.width,
    required this.height,
    required this.label,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,

      child: TextButton(
        onPressed: () => onTap(),
        
        style: TextButton.styleFrom(
          backgroundColor: primaryBlueColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12)
          )
        ),
        
        child: Text(
          label,
          style: whiteTextStyle.copyWith(
            fontSize: 14,
            fontWeight: medium
          ),
        ),
      ),
    );
  }
}























