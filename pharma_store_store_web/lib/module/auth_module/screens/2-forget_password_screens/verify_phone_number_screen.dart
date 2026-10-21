import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pharma_store_store_web/module/auth_module/widgets/button_widget.dart';
import 'package:pharma_store_store_web/module/auth_module/widgets/input_field_widget.dart';
import 'package:pharma_store_store_web/module/auth_module/widgets/left_side_widget.dart';
import 'package:pharma_store_store_web/module/auth_module/widgets/right_side_widget.dart';
import 'package:pharma_store_store_web/shared/functions/functions.dart';
import 'package:pharma_store_store_web/shared/styles/color/colors.dart';

class VerifyPhoneNumberScreen extends StatelessWidget {
  static const String routeName = 'VerifyPhoneNumberScreenRoute';
  VerifyPhoneNumberScreen({super.key});

  final otpController = TextEditingController();
  final formkey = GlobalKey<FormState>();

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => VerifyPhoneNumberScreen(),
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
    return Form(
      key: formkey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Verify phone number ',
            style: TextStyle(
              color: HexColor(black),
              fontSize: 24,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 10.0),
          const Text(
            'We sent a verification code to 012**75. Please check your mobile device and enter the code.',
            style: TextStyle(
              color: Color(0xFF60656E),
              fontWeight: FontWeight.w400,
              fontSize: 12,
              fontFamily: 'Poppins',
            ),
          ),
          const SizedBox(height: 86.0),
          Text(
            'Verification code',
            style: TextStyle(
              color: HexColor(black),
              fontSize: 16,
              fontFamily: 'Poppins',
            ),
          ),
          const SizedBox(height: 4.0),
          inputFieldWidget(
            controller: otpController,
            hintText: 'Enter verification code',
            validator: (value){
              if(otpController.text.isEmpty){
                return 'Your Verification code is empty';
              }else if(otpController.text.length != 6){
                return 'Your Verification code is not correct';
              }
              return null;
            }
          ),
          const SizedBox(height: 86.0),
          buttonWidget(
            kind: 2,
            text: "Verify",
            onPressed: (){
              if (formkey.currentState!.validate()) {
               navigateTo(context, 'ResetPasswordScreenRoute') ;
              }
            },
          ),
          const SizedBox(height: 17),
          Center(
            child: GestureDetector(
              onTap: () {
                navigateTo(context, 'LoginScreenRoute');
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.arrow_back,
                    color: HexColor(primary),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    'Back to login page',
                    style: TextStyle(
                      color: HexColor(primary),
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
