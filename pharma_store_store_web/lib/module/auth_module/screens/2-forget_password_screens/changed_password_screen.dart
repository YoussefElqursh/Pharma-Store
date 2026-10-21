import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pharma_store_store_web/module/auth_module/widgets/button_widget.dart';
import 'package:pharma_store_store_web/module/auth_module/widgets/left_side_widget.dart';
import 'package:pharma_store_store_web/module/auth_module/widgets/right_side_widget.dart';
import 'package:pharma_store_store_web/shared/functions/functions.dart';
import 'package:pharma_store_store_web/shared/styles/color/colors.dart';

class ChangedPasswordScreen extends StatelessWidget {

  static const String routeName = 'ChangedPasswordScreenRoute';

  const ChangedPasswordScreen({super.key});

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const ChangedPasswordScreen(),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const Expanded(
            child: LeftSideWidget(),
          ),
          Expanded(
            child: RightSideWidget(
              height: 518,
              child: rightSide(context),
            ),
          ),
        ],
      ),
    );
  }

  rightSide(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          setPhoto(kind: 1, path: 'assets/images/taddaaa_image.svg', width: 240, height: 190),
          const SizedBox(height: 50),
          Text(
            'Successful password reset!',
            style: TextStyle(
              color: HexColor(black),
              fontSize: 18,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 13),
          const Text(
            'You can now use your new password to log in to your account.',
            style: TextStyle(
              color: Color(0xFF60656E),
              fontSize: 14,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 50),
          buttonWidget(
            kind: 2,
            text: "Login",
            onPressed: (){
              navigateTo(context, 'LoginScreenRoute');
            },
          ),
        ],
    );
  }
}
