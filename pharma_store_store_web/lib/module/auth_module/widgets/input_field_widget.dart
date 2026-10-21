import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pharma_store_store_web/shared/styles/color/colors.dart';

Widget inputFieldWidget({
  required String? hintText,
  bool obscureText = false,
  double minWidth = 350,
  double maxWidth = double.infinity,
  double maxHeight = 48,
  double minHeight = 48,
  TextEditingController? controller,
  String? Function(String?)? validator,
  void Function(String)? onChanged,
  void Function()? onSuffixPressed,
  Icon? suffixIcon,
}) {
  return TextFormField(
    obscureText: obscureText,
    controller: controller,
    validator: validator,
    onChanged: onChanged,
    decoration: InputDecoration(
      constraints: BoxConstraints(
        maxWidth: maxWidth,
        maxHeight: maxHeight,
        minWidth: minWidth,
        minHeight: minHeight,
      ),
      hintText: hintText,
      hintStyle: TextStyle(
        color: HexColor(white70),
        fontSize: 14,
        fontWeight: FontWeight.w400,
        fontFamily: 'Poppins',
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(
            color: Color(0xFFDDE1EB),
            strokeAlign: BorderSide.strokeAlignCenter,
            width: 1.5),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(
            color: Color(0xFFDDE1EB),
            strokeAlign: BorderSide.strokeAlignCenter,
            width: 1.5),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(
            color: Color(0xFFDDE1EB),
            strokeAlign: BorderSide.strokeAlignCenter,
            width: 1.5),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(
            color: Color(0xFFDDE1EB),
            strokeAlign: BorderSide.strokeAlignCenter,
            width: 1.5),
      ),
      suffixIcon: IconButton(
          onPressed: onSuffixPressed,
          icon: suffixIcon?? const SizedBox(),
      ),
      suffixIconColor: HexColor(white70),
    ),
  );
}
