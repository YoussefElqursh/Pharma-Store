import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:meta/meta.dart';
import 'package:pharma_store_store_web/shared/constants/end_points.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitialState());

  void userLogin({required String username, required String password}) async {
    emit(LoginLoadingState());
    try {
      Response response =
      await http.post(Uri.parse(baseUrl + loginRoute),
          body: {
        "userName": username,
        "password": password,
        "userType": "store",
      },
      );
      if (response.statusCode == 201) {
        var data = jsonDecode(response.body);
        debugPrint('User login success and his data is : $data');
        emit(LoginSuccessState());
      }
      if (response.statusCode == 401) {
        var data = jsonDecode(response.body);
        debugPrint('User login failed and back data is : ${data['message']}');
        emit(LoginErrorState(message: data['message']));
      }
    } catch (e) {
      emit(LoginErrorState(message: e.toString()));
    }
  }

  Icon suffix = const Icon(Icons.visibility_outlined);
  bool isPassword = true ;

  void changePasswordVisibility (){
    isPassword = !isPassword;
    suffix = isPassword ? const Icon(Icons.visibility_outlined) : const Icon(Icons.visibility_off_outlined);
    emit(LoginChangePasswordVisibility());
  }
}
