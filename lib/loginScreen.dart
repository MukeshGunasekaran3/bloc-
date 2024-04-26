import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loginform/bloc/auth_bloc.dart';
import 'package:loginform/nextscreen.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController user = TextEditingController();
    TextEditingController pass = TextEditingController();
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthSucess) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => Nextscreen(),
              ),
              (route) => false);
        }
        if (state is AuthFailure) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.reason)));
        }
      },
      builder: (context, state) {
        if (state is AuthLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return Scaffold(
          body: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: user,
                  decoration: InputDecoration(label: Text('user id')),
                ),
                TextFormField(
                  controller: pass,
                  decoration: InputDecoration(label: Text('password')),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      context
                          .read<AuthBloc>()
                          .add(LoginEvent(user.text, pass.text));
                    },
                    child: Text('sign in'))
              ],
            ),
          ),
        );
      },
    );
  }
}
