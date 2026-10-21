import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pharma_store_store_web/shared/styles/color/colors.dart';
import 'package:pharma_store_store_web/shared/styles/flutter_icons_icons.dart';

class ScreenHeader extends StatelessWidget {
  const ScreenHeader({super.key, required this.screenName});

  final String screenName;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54,
      decoration: BoxDecoration(
        border: Border.symmetric(
          horizontal: BorderSide(
            color: HexColor('#DDE1EB'),
            width: 1,
          ),
          vertical: BorderSide.none,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              screenName,
              style: TextStyle(
                color: HexColor(black),
                fontSize: 22,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
              ),
            ),
            const Spacer(),
            Row(
              children: [
                IconButton(
                  onPressed: () => Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          FadeTransition(
                        opacity: animation,
                        //child: const NotificationScreen(),
                      ),
                    ),
                  ),
                  icon: const Icon(FlutterIcons.notification, size: 15),
                ),
                const SizedBox(width: 25),
                ClipOval(
                  child: Container(
                    width: 32,
                    height: 32,
                    color: Colors.cyan,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
