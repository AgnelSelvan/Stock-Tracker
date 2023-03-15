import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_tracker/modules/auth/presentation/state/cubit/login/login_cubit.dart';

class RememberMe extends StatelessWidget {
  const RememberMe({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            context.read<LoginCubit>().toggleRememberMe();
          },
          child: Row(
            children: [
              Transform.scale(
                scale: 0.8,
                child: Checkbox(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  side: BorderSide(
                    color: Colors.grey[400]!,
                  ),
                  value: state.rememberMe,
                  onChanged: (val) {
                    context.read<LoginCubit>().toggleRememberMe();
                  },
                ),
              ),
              Text(
                "Remember Me",
                style: Theme.of(context)
                    .textTheme
                    .labelSmall
                    ?.copyWith(color: Colors.grey[600]),
              )
            ],
          ),
        );
      },
    );
  }
}
