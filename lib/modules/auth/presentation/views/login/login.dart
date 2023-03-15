import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stock_tracker/modules/auth/presentation/state/bloc/auth_bloc.dart';
import 'package:stock_tracker/modules/auth/presentation/views/login/widgets/remember_me.dart';
import 'package:stock_tracker/router/router.dart';
import 'package:stock_tracker/utility/assets/assets.dart';
import 'package:stock_tracker/utility/colors/colors.dart';
import 'package:stock_tracker/utility/popup.dart';
import 'package:stock_tracker/widgets/loader.dart';
import 'package:stock_tracker/widgets/textfield.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _passwordFocusNode = FocusNode();
  final _isLoading = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          print(state);
          if (state is AuthLoading) {
            _isLoading.value = true;
          } else {
            _isLoading.value = false;
            if (state is AuthLoaded) {
              AppPopup.success(context,
                  title: "Logged in as ${state.user.displayName}");
              Navigator.pushReplacementNamed(context, AppRoutes.home);
            } else if (state is AuthError) {
              AppPopup.error(context, title: state.message);
            }
          }
        },
        child: Stack(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.5 / 1.8,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    AppAssets.logo,
                                    width: 40,
                                    fit: BoxFit.contain,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Stock Tracker",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall
                                        ?.copyWith(
                                          color: Colors.grey.shade800,
                                        ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 50,
                              ),
                              Text(
                                "Login",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge
                                    ?.copyWith(
                                      color: Colors.grey.shade900,
                                    ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Login with your data you entered during registration",
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium
                                    ?.copyWith(
                                      color: Colors.grey.shade400,
                                    ),
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              AppTextField(
                                controller: _emailController,
                                labelText: "Your Email",
                                hintText: "example@gmail.com",
                                onEditingComplete: () {
                                  _passwordFocusNode.requestFocus();
                                },
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              AppTextField(
                                controller: _passwordController,
                                labelText: "Your Password",
                                obsecureText: true,
                                focusNode: _passwordFocusNode,
                                onEditingComplete: () {
                                  _handleLogin(context);
                                },
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const RememberMe(),
                              const SizedBox(
                                height: 20,
                              ),
                              FilledButton(
                                style: FilledButton.styleFrom(
                                    minimumSize: const Size.fromHeight(49),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                onPressed: () {
                                  _handleLogin(context);
                                },
                                child: const Text("Login"),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Center(
                                child: RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "Don't have an account? ",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall,
                                      ),
                                      WidgetSpan(
                                        child: InkWell(
                                          onTap: () {
                                            Navigator.pushReplacementNamed(
                                              context,
                                              AppRoutes.register,
                                            );
                                          },
                                          child: Text(
                                            " Sign up",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall
                                                ?.copyWith(
                                                  fontWeight: FontWeight.w700,
                                                  color: AppColors.primaryColor,
                                                ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    color: AppColors.primaryColor[700]!,
                    child: SvgPicture.asset(AppAssets.loginSVG),
                  ),
                ),
              ],
            ),
            ValueListenableBuilder(
              valueListenable: _isLoading,
              builder: ((context, value, child) {
                if (value) {
                  return const Loader();
                } else {
                  return const SizedBox();
                }
              }),
            )
          ],
        ),
      ),
    );
  }

  void _handleLogin(BuildContext context) {
    context
        .read<AuthBloc>()
        .add(HandleLogin(_emailController.text, _passwordController.text));
  }
}
