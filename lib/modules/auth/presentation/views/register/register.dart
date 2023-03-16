import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_tracker/modules/auth/presentation/state/cubit/register/register_cubit.dart';
import 'package:stock_tracker/router/router.dart';
import 'package:stock_tracker/utility/assets/assets.dart';
import 'package:stock_tracker/utility/colors/colors.dart';
import 'package:stock_tracker/utility/constants/constants.dart';
import 'package:stock_tracker/widgets/loader.dart';
import 'package:stock_tracker/widgets/textfield.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _passwordFocusNode = FocusNode();
  final _isLoading = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
                              "Register",
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
                              "Get Registered to get started with Stock Tracker",
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
                            Row(
                              children: [
                                Expanded(
                                  child: AppTextField(
                                    labelText: "First Name",
                                    hintText: "John",
                                    onEditingComplete: () {},
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: AppTextField(
                                    labelText: "Last Name",
                                    hintText: "Doe",
                                    onEditingComplete: () {},
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
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
                              onEditingComplete: () {},
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            FilledButton(
                              style: FilledButton.styleFrom(
                                  minimumSize: const Size.fromHeight(49),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              onPressed: () {},
                              child: const Text("Sign Up"),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Center(
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "Already have an account? ",
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                    ),
                                    WidgetSpan(
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.pushReplacementNamed(
                                            context,
                                            AppRoutes.login,
                                          );
                                        },
                                        child: Text(
                                          " Login",
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
                  padding: const EdgeInsets.all(20),
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5 / 1.8,
                        child: Column(
                          children: [
                            Text(
                              "Company Details",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(
                                    color: Colors.grey.shade800,
                                  ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            AppTextField(
                              labelText: "Company Name",
                              onEditingComplete: () {},
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            AppTextField(
                              labelText: "Company Address",
                              onEditingComplete: () {},
                              maxLines: 3,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            DropdownButton(
                              items: Constants.stateAndCityList.keys
                                  .toList()
                                  .map((e) => DropdownMenuItem(
                                        value: e,
                                        child: Text(e),
                                      ))
                                  .toList(),
                              onChanged: (val) {
                                context.read<RegisterCubit>().updateState(
                                      val,
                                      Constants.stateAndCityList[val],
                                    );
                              },
                            ),
                            DropdownButton(
                              items: Constants.stateAndCityList.keys
                                  .toList()
                                  .map((e) => DropdownMenuItem(
                                        value: e,
                                        child: Text(e),
                                      ))
                                  .toList(),
                              onChanged: (val) {},
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
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
    );
  }
}
