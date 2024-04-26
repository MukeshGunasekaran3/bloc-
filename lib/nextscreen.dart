import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loginform/bloc/auth_bloc.dart';
import 'package:loginform/loginScreen.dart';

class Nextscreen extends StatelessWidget {
  const Nextscreen({super.key});

  @override
  Widget build(BuildContext context) {
    // String a = context.read<AuthSucess>().userid;
    return BlocConsumer<AuthBloc, AuthState>(listener: (context, state) {
      if (state is AuthInitial) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const Login(),
            ),
            (route) => false);
      }
    }, builder: (context, state) {
      if (state is AuthLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }

      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text((state as AuthSucess).userid),
                // Text(context.read<AuthSucess>().userid),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      context.read<AuthBloc>().add(LogoutEvent());
                    },
                    child: const Text('sign out'))
              ],
            ),
          ),
        ),
      );
    });
  }
}
