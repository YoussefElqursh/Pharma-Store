import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma_store_store_web/shared/functions/functions.dart';

class RightSideWidget extends StatelessWidget {
  const RightSideWidget({super.key, required this.child, required this.height});

  final double height;
  final Widget child ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: setPhoto(
              kind: 1,
              path: 'assets/images/Card-login-background.svg',
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100.0),
              child: Container(
                width: 450.w,
                height: height,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  shadows: const [
                    BoxShadow(
                      color: Color(0xFFDDE1EB),
                      blurRadius: 64,
                      offset: Offset(0, 32),
                      spreadRadius: -12,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(50),
                  child: child,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
