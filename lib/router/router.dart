import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_tracker/di.dart' as di;
import 'package:stock_tracker/modules/auth/presentation/state/bloc/auth_bloc.dart';
import 'package:stock_tracker/modules/auth/presentation/state/cubit/login/login_cubit.dart';
import 'package:stock_tracker/modules/auth/presentation/state/cubit/register/register_cubit.dart';
import 'package:stock_tracker/modules/auth/presentation/views/login/login.dart';
import 'package:stock_tracker/modules/auth/presentation/views/register/register.dart';
import 'package:stock_tracker/modules/home/home.dart';
import 'package:stock_tracker/modules/splash/splash.dart';

class AppRoutes {
  static const String splash = "/";

  //AUTH Screens
  static const String login = "/auth/login";
  static const String register = "/auth/register";

  static const String home = "/home";

  static Route onGenerateRoutes(RouteSettings settings) {
    late Widget currentScreen;
    switch (settings.name) {
      case AppRoutes.splash:
        currentScreen = const SplashScreen();
        break;
      case AppRoutes.login:
        currentScreen = MultiBlocProvider(
          providers: [
            BlocProvider<AuthBloc>(
              create: (context) => di.localtor<AuthBloc>(),
            ),
            BlocProvider(
              create: (context) => LoginCubit(),
            ),
          ],
          child: LoginScreen(),
        );
        break;
      case AppRoutes.home:
        currentScreen = const HomeScreen();
        break;
      case AppRoutes.register:
        currentScreen = BlocProvider(
          create: (context) => RegisterCubit(),
          child: RegisterScreen(),
        );
        break;
      default:
        currentScreen = const SplashScreen();
        break;
    }
    return MaterialPageRoute(
        builder: ((context) => currentScreen), settings: settings);
  }
}
