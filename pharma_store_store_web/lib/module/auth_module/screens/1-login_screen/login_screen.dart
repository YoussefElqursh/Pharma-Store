import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pharma_store_store_web/module/auth_module/bloc/login_bloc/login_cubit.dart';
import 'package:pharma_store_store_web/module/auth_module/widgets/button_widget.dart';
import 'package:pharma_store_store_web/module/auth_module/widgets/input_field_widget.dart';
import 'package:pharma_store_store_web/module/auth_module/widgets/left_side_widget.dart';
import 'package:pharma_store_store_web/module/auth_module/widgets/right_side_widget.dart';
import 'package:pharma_store_store_web/module/home_module/screens/1-home_screen/home_screen.dart';
import 'package:pharma_store_store_web/shared/functions/functions.dart';
import 'package:pharma_store_store_web/shared/styles/color/colors.dart';

class LoginScreen extends StatefulWidget {

  static const String routeName = 'LoginScreenRoute';


  const LoginScreen({super.key});

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const LoginScreen(),
    );
  }

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final usernameController = TextEditingController();

  final passwordController = TextEditingController();

  final formkey = GlobalKey<FormState>();

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
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if( state is LoginSuccessState){
          navigateToWithoutBack(context, const HomeScreen());
        }
        else if( state is LoginErrorState){
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: SizedBox(
                child: Text(
                  'something went wrong, try again later',
                ),
              ),
            ),
          );
        }
      },
      builder: (context, state) {
        return Form(
          key: formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.center,
                child: Text.rich(
                  const TextSpan(
                    children: [
                      TextSpan(
                        text: 'Log',
                        style: TextStyle(
                          color: Color(0xff23262a),
                          fontSize: 28,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextSpan(
                        text: 'in',
                        style: TextStyle(
                          color: Color(0xff4a72ff),
                          fontSize: 28,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextSpan(
                        text: ' ',
                        style: TextStyle(
                          color: Color(0xff23262a),
                          fontSize: 28,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  style: TextStyle(
                    color: const Color(0xff23262a),
                    fontSize: 28.sp,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              const SizedBox(height: 50.0),
              Text(
                'Username',
                style: TextStyle(
                  color: HexColor(black),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Poppins',
                ),
              ),
              const SizedBox(height: 4.0),
              inputFieldWidget(
                controller: usernameController,
                hintText: 'Enter username',
                maxHeight: 48,
                validator: (value) {
                  if (usernameController.text.isEmpty) {
                    return 'Username is empty';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15.0),
              Text(
                'Password',
                style: TextStyle(
                  color: HexColor(black),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Poppins',
                ),
              ),
              const SizedBox(height: 4.0),
              inputFieldWidget(
                controller: passwordController,
                hintText: 'Enter password',
                maxHeight: 48,
                obscureText: BlocProvider.of<LoginCubit>(context).isPassword,
                suffixIcon: BlocProvider.of<LoginCubit>(context).suffix,
                onSuffixPressed: (){
                  BlocProvider.of<LoginCubit>(context).changePasswordVisibility();
                },
                validator: (input) {
                  if (passwordController.text.isEmpty) {
                    return 'Password is empty';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 4.0),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    navigateTo(
                        context, 'ForgetPasswordScreenRoute');
                  },
                  child: Text(
                    'Forgot password?',
                    style: TextStyle(
                      color: HexColor(primary),
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 50.0),
              state is! LoginLoadingState ?
              buttonWidget(
                kind: 2,
                text: "Login",
                onPressed: () {
                  if (formkey.currentState!.validate()) {
                    BlocProvider.of<LoginCubit>(context).userLogin(
                      username: usernameController.text,
                      password: passwordController.text,
                    );
                  }
                },
              )
              :
              const Center(
                child: CircularProgressIndicator(),
              ),
              const SizedBox(height: 15.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Don’t have an account? ',
                          style: TextStyle(
                            color: Color(0xFF23262A),
                            fontSize: 12,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      navigateTo(
                          context, 'BasicDetailsScreenRoute');
                    },
                    child: const Text(
                      'Create Account',
                      style: TextStyle(
                        color: Color(0xFF4A71FF),
                        fontSize: 12,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
