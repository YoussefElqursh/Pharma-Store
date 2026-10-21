import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pharma_store_store_web/module/auth_module/widgets/button_widget.dart';
import 'package:pharma_store_store_web/module/auth_module/widgets/left_side_widget.dart';
import 'package:pharma_store_store_web/module/auth_module/widgets/right_side_widget.dart';
import 'package:pharma_store_store_web/shared/functions/functions.dart';
import 'package:pharma_store_store_web/shared/styles/color/colors.dart';

class AccountCreatedScreen extends StatelessWidget {

  static const String routeName = 'AccountCreatedScreenRoute';

  const AccountCreatedScreen({super.key});

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const AccountCreatedScreen(),
    );
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Row(
        children: [
          const Expanded(
            child: LeftSideWidget(),
          ),
          Expanded(
            child: RightSideWidget(
              height: 520,
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
          'Account Created!',
          style: TextStyle(
            color: HexColor(black),
            fontSize: 18,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 13),
        const Text(
          'Your account has been created\nsuccessfully.',
          style: TextStyle(
            color: Color(0xFF425260),
            fontSize: 14,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
          ),
          textAlign: TextAlign.center,
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
