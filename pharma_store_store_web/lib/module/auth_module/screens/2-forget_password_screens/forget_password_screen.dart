import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pharma_store_store_web/module/auth_module/widgets/button_widget.dart';
import 'package:pharma_store_store_web/module/auth_module/widgets/left_side_widget.dart';
import 'package:pharma_store_store_web/module/auth_module/widgets/right_side_widget.dart';
import 'package:pharma_store_store_web/shared/functions/functions.dart';
import 'package:pharma_store_store_web/shared/styles/color/colors.dart';

class ForgetPasswordScreen extends StatelessWidget {

  static const String routeName = 'ForgetPasswordScreenRoute';

  final phoneNumberController = TextEditingController();
  final formkey = GlobalKey<FormState>();

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => ForgetPasswordScreen(),
    );
  }

  ForgetPasswordScreen({super.key});

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
            'Forgot password',
            style: TextStyle(
              color: HexColor(black),
              fontSize: 24,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 10.0),
          const Text(
            'Enter a phone number to get a text message with a verification code.',
            style: TextStyle(
              color: Color(0xFF60656E),
              fontSize: 12,
              fontWeight: FontWeight.w400,
              fontFamily: 'Poppins',
            ),
          ),
          const SizedBox(height: 90.0),
          Text(
            'Phone number',
            style: TextStyle(
              color: HexColor(black),
              fontSize: 14,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 4.0),
          Container(
            height: 48,
            decoration: BoxDecoration(
              border: Border.all(
                color: HexColor(bWhite90),
                width: 1.5,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 16,
                ),
                Text(
                  '+20',
                  style: TextStyle(
                    color: HexColor(black),
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: TextFormField(
                    controller: phoneNumberController,
                    validator: (value){
                      if(phoneNumberController.text.isEmpty){
                        return 'Phone Number is empty';
                      }else if(phoneNumberController.text.length != 11){
                        return 'Phone Number is wrong';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      constraints: BoxConstraints(
                          maxWidth: 380, maxHeight: 48),
                      hintText: 'Enter phone number',
                      hintStyle: TextStyle(
                        color: Color(0xFFB1B9C5),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Poppins',
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(8),
                            topRight: Radius.circular(8)),
                        borderSide: BorderSide(
                            color: Color(0xFFDDE1EB),
                            strokeAlign: BorderSide.strokeAlignCenter,
                            width: 0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(8),
                            topRight: Radius.circular(8)),
                        borderSide: BorderSide(
                            color: Color(0xFFDDE1EB),
                            strokeAlign: BorderSide.strokeAlignCenter,
                            width: 0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(8),
                            topRight: Radius.circular(8)),
                        borderSide: BorderSide(
                            color: Color(0xFFDDE1EB),
                            strokeAlign: BorderSide.strokeAlignCenter,
                            width: 0),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(8),
                            topRight: Radius.circular(8)),
                        borderSide: BorderSide(
                            color: Color(0xFFDDE1EB),
                            strokeAlign: BorderSide.strokeAlignCenter,
                            width: 0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 90),
          buttonWidget(
            kind: 2,
            text: 'Send',
            onPressed: (){
              if (formkey.currentState!.validate()) {
                navigateTo(
                    context, 'VerifyPhoneNumberScreenRoute');
              }
            },
          ),
          const SizedBox(height: 16),
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
          )
        ],
      ),
    );
  }
}
