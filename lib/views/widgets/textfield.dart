import 'package:flutter/material.dart';
import '../../constant/colors.dart';

class CTextFField extends StatelessWidget {
  final String label;
  final Color textColor;
  final Color cursorColor;
  final Color borderColor;
  final Color focusedBorderColor;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final bool obscureText;
  final String? Function(String?)? validator;
  final EdgeInsetsGeometry padding;
  final VoidCallback? onTap;
  final Widget? suffixIcon;

  const CTextFField({
    super.key,
    required this.label,
    required this.controller,
    this.keyboardType,
    this.obscureText = false,
    this.validator,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    this.textColor = Colors.white,
    this.cursorColor = CColor.primaryColor,
    this.borderColor = Colors.grey,
    this.focusedBorderColor = CColor.primaryColor,
    this.onTap,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: TextFormField(
        controller: controller,
        cursorColor: cursorColor,
        keyboardType: keyboardType,
        obscureText: obscureText,
        style: TextStyle(color: textColor),
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          label: Text(
            label,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: borderColor), // saat tidak fokus
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: focusedBorderColor,
              width: 2,
            ), // saat fokus
          ),
          errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: CColor.errColor,
            ), // saat error
          ),
        ),
        validator: validator,
      ),
    );
  }
}
