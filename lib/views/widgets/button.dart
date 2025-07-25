import 'package:flutter/material.dart';

import '../../constant/colors.dart';

class CButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final double width;
  final double height;
  final double fontSize;
  final Color color;
  final Color textColor;
  final bool useNicoMoji;
  final double borderRadius;
  final Icon suffixIcon;

  const CButton({
    super.key,
    required this.label,
    required this.onTap,
    this.width = 310.0,
    this.height = 50.0,
    this.fontSize = 16.0,
    this.color = CColor.primaryColor,
    this.textColor = Colors.white,
    this.useNicoMoji = false,
    this.borderRadius = 32,
    this.suffixIcon = const Icon(Icons.visibility),
  });

  @override

  Widget build(BuildContext context) {
  return Material(
    color: color,
    borderRadius: BorderRadius.circular(borderRadius),
    child: InkWell(
      onTap: onTap,
      splashColor: Colors.white.withValues(alpha: 0.3),
      borderRadius: BorderRadius.circular(borderRadius),
      child: SizedBox(
        width: width,
        height: height,
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: textColor,
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              fontFamily: useNicoMoji ? 'NicoMoji' : null,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    ),
  );
}
}
