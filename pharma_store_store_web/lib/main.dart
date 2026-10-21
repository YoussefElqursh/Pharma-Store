import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharma_store_store_web/module/auth_module/bloc/create_account_bloc/create_account_cubit.dart';
import 'package:pharma_store_store_web/module/auth_module/bloc/login_bloc/login_cubit.dart';
import 'package:pharma_store_store_web/module/auth_module/screens/1-login_screen/login_screen.dart';
import 'package:pharma_store_store_web/shared/bloc_observer.dart';
import 'package:pharma_store_store_web/shared/routing/app_route.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(create: (context) => CreateAccountCubit()),
      ],
      child: ScreenUtilInit(
          designSize: const Size(360, 690),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (BuildContext context, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              themeMode: ThemeMode.system,
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF4A72FF)),
                useMaterial3: true,
              ),
              onGenerateRoute: AppRouter.onGenerateRoute,
              initialRoute: LoginScreen.routeName
            );
          },
      ),
    );
  }
}
