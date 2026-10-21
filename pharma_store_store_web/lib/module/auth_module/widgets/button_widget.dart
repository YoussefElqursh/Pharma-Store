 import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pharma_store_store_web/shared/styles/color/colors.dart';

buttonWidget ({
  required int kind,
  required String text,
  double height = 48,
  double width = double.infinity,
  String color = primary,
  required void Function()? onPressed,
 }){
  return Container(
    height: height,
    width: width,
    decoration: BoxDecoration(
      color: HexColor(color),
      borderRadius: BorderRadius.circular(8),
      border: Border.all(
        color: HexColor(primary),
      ),
    ),
    child: MaterialButton(
      onPressed: onPressed,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: kind == 0 ? Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(width: 12),
          const Icon(Icons.arrow_forward_sharp, color: Colors.white,)
        ],
      )
          :
      kind == 1 ? Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(Icons.arrow_back_sharp, color:Color(0xFF4A71FF),),
          const SizedBox(width: 12),
          Text(
            text,
            style: const TextStyle(
              color: Color(0xFF4A71FF),
              fontSize: 14,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      )
          :
      Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
  );
 }