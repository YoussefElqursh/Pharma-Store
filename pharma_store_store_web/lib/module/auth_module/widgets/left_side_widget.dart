import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pharma_store_store_web/shared/functions/functions.dart';
import 'package:pharma_store_store_web/shared/styles/color/colors.dart';

class LeftSideWidget extends StatelessWidget {
  const LeftSideWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.only(left: 165.0, top: 152.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              setPhoto(kind: 1, path: 'assets/images/Logo-app.svg'),
              Text(
                'Welcome to\nPharma Store\nStore Area.',
                style: TextStyle(
                  color: HexColor(black),
                  fontSize: 48,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
    );
  }
}
