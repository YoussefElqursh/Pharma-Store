import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:http/http.dart';
import 'package:meta/meta.dart';
import 'package:pharma_store_store_web/shared/constants/end_points.dart';

part 'create_account_state.dart';

class CreateAccountCubit extends Cubit<CreateAccountState> {
  CreateAccountCubit() : super(CreateAccountInitialState());

  void userRegister ({
    required String storeName,
    required String country,
    required String governorate,
    required String region,
    required String address,
    required String contactNumber,
    required String email,
    required File taxLicense,
    required File taxCard,
    required File commercialRegister,
    required String userName,
    required String password,
    required String isActive,
})async{
    emit(CreateAccountLoadingState());
    // try {
    //   Response response =
    //   await http.post(Uri.parse(baseUrl + registerRoute),
    //     body: {
    //       'storeName': storeName,
    //       'country': country,
    //       'governorate': governorate,
    //       'region': region,
    //       'address': address,
    //       'contactNumber': contactNumber,
    //       'email': email,
    //       'userName': userName,
    //       'password': password,
    //       'isActive': isActive,
    //       'taxLicense': taxLicense,
    //       'taxCard': taxCard,
    //       'commercialRegister': commercialRegister,
    //     },
    //   );
    //   if (response.statusCode == 201) {
    //     var data = jsonDecode(response.body);
    //     debugPrint('User login success and his data is : $data');
    //     emit(CreateAccountSuccessState());
    //   }
    //    if(response.statusCode == 401) {
    //     var data = jsonDecode(response.body);
    //     debugPrint('User login failed and back data is : ${data['message']}');
    //     emit(CreateAccountErrorState(message: data['message']));
    //   }
    // } catch (e) {
    //   emit(CreateAccountErrorState(message: e.toString()));
    // }

    var request = http.MultipartRequest('POST', Uri.parse('https://ebf8-41-46-95-131.ngrok-free.app/auth/register/store'));
    request.fields.addAll({
      'storeName': storeName,
      'country': country,
      'governorate': governorate,
      'region': region,
      'address': address,
      'contactNumber': contactNumber,
      'email': email,
      'userName': userName,
      'password': password
    });
    request.files.add(await http.MultipartFile.fromPath('taxLicense', taxLicense.path));
    request.files.add(await http.MultipartFile.fromPath('taxCard', taxCard.path));
    request.files.add(await http.MultipartFile.fromPath('commercialRegister', commercialRegister.path));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 201) {
      debugPrint(await response.stream.bytesToString());
      emit(CreateAccountSuccessState());
    }
    else {
      debugPrint(response.reasonPhrase);
      emit(CreateAccountErrorState(message: response.reasonPhrase!));
    }
  }

  Icon suffix = const Icon(Icons.visibility_outlined);
  bool isPassword = true ;

  void changePasswordVisibility (){
    isPassword = !isPassword;
    suffix = isPassword ? const Icon(Icons.visibility_outlined) : const Icon(Icons.visibility_off_outlined);
    emit(CreateAccountChangePasswordVisibility());
  }
}
